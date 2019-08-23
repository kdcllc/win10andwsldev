# Docker related useful information

## Useful Commands

```bash
    # clean up system
    docker system prune -f
    docker container prune -f

    # list all images
    docker images -f dangling=true
    # clean up
    docker rmi -f $(docker images -f "dangling=true" -q)

```

[Use Docker to build, test and push your Artifacts](https://lostechies.com/gabrielschenker/2016/09/26/use-docker-to-build-test-and-push-your-artifacts/)