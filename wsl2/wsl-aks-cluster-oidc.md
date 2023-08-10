# Azure AD Workload Identity on AKS

[Source Video](https://www.youtube.com/watch?v=5WUP8KAzwCo&ab_channel=MicrosoftAzure)

1. Create AKS cluster with OIDC issuer enabled feature

[Configure an AKS cluster - Before you begin](https://docs.microsoft.com/en-us/azure/aks/cluster-configuration#before-you-begin)

Enable Preview Feature

> az feature register --name EnableOIDCIssuerPreview --namespace Microsoft.ContainerService

> az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService/EnableOIDCIssuerPreview')].{Name:name,State:properties.state}"

> az extension add --name aks-preview

> az aks create -n demo-oidc -g aks-cluster-test -s Standard_B2s --enable-oidc-issuer

> az aks show -n demo-oidc -g aks-cluster-test --query "oidcIssuerProfile.issuerUrl" -otsv

> https://oidc.prod-aks.azure.com/{guid-id}/

2. Enable Workload Identity

[Azure AD Workload Identity - Mutating Admission Webhook](https://azure.github.io/azure-workload-identity/docs/installation/mutating-admission-webhook.html)

Get credentials to local
> az aks get-credentials -n demo-oidc -g aks-cluster-test

Install Charts
> helm repo add azure-workload-identity https://azure.github.io/azure-workload-identity/charts
> helm repo update

Set tenant ID
> $AZURE_TENANT_ID = $(az account show -s a8359c3e-430b-4078-b89c-cd39b66dd0a5 --query tenantId -otsv)

> helm install workload-identity-webhook azure-workload-identity/workload-identity-webhook  --namespace azure-workload-identity-system  --create-namespace --set azureTenantID=$AZURE_TENANT_ID

WSL now here
> curl -sL https://github.com/Azure/azure-workload-identity/releases/download/v0.12.0/azure-wi-webhook.yaml | envsubst | kubectl apply -f -

3. Setup Azure AD Workload Identity with Azure Key Vault Secrets

[Azure AD Workload Identity - Quick Start](https://azure.github.io/azure-workload-identity/docs/quick-start.html)

Setup Environment variables
> export vault_name="demo-aks-kv"
> export vault_secret_name="my-secret"
> export rs_group="aks-cluster-test"
> export location="eastus2"
> export app_name="demo-aks-oidc"
> export account_namespace="default"
> export account_name="demo_workload_identity_sa"
> export account_issuer="https://oidc.prod-aks.azure.com/{guid-id}/"

Create Vault

```bash
    az keyvault secret set --vault-name "${vault_name}" \
       --name "${vault_secret_name}" \
       --value "Hello\!"
```

4. Create and Identity

> az ad sp create-for-rbac --name "${app_name}"

```json
{
  "appId": "{app-guid-id}",
  "displayName": "demo-aks-oidc",
  "password": "{app-password}",
  "tenant": "{tenant-guid}"
}
```

5. Create access policy

> export client_id="$(az ad sp list --display-name "${app_name}" --query '[0].appId' -otsv)"

```bash
    az keyvault set-policy --name "${vault_name}" \
      --secret-permissions get \
      --spn "${client_id}"
```

6. Create a kubernetes service account

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  annotations:
    azure.workload.identity/client-id: ${client_id}
  labels:
    azure.workload.identity/use: "true"
  name: ${app_name}
  namespace: ${account_namespace}
EOF

```

7. Establish trust between aks and Azure AD

Get the object ID of the AAD application

> export APPLICATION_OBJECT_ID="$(az ad app show --id ${client_id} --query id -otsv)"

```bash
cat <<EOF > params.json
{
  "name": "kubernetes-federated-credential",
  "issuer": "${account_issuer}",
  "subject": "system:serviceaccount:${account_namespace}:${app_name}",
  "description": "Kubernetes service account federated credential",
  "audiences": [
    "api://AzureADTokenExchange"
  ]
}
EOF
```

> az ad app federated-credential create --id ${APPLICATION_OBJECT_ID} --parameters @params.json

@params.json
```json
{
  "@odata.context": "https://graph.microsoft.com/v1.0/$metadata#applications('{guid-id}')/federatedIdentityCredentials/$entity",
  "audiences": [
    "api://AzureADTokenExchange"
  ],
  "description": "Kubernetes service account federated credential",
  "id": "{guid-id}",
  "issuer": "https://oidc.prod-aks.azure.com/{guid-id}/",
  "name": "kubernetes-federated-credential",
  "subject": "system:serviceaccount:default:demo-aks-oidc"
}
```


8. Deploy sample workload

```bash
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: quick-start
  namespace: ${account_namespace}
spec:
  serviceAccountName: ${app_name}
  containers:
    - image: ghcr.io/azure/azure-workload-identity/msal-go
      name: oidc
      env:
      - name: KEYVAULT_NAME
        value: ${vault_name}
      - name: SECRET_NAME
        value: ${vault_secret_name}
  nodeSelector:
    kubernetes.io/os: linux
EOF
```

> kubectl describe pod quick-start
> kubectl logs quick-start

