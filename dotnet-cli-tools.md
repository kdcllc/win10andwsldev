# DotNet Core CLI tools

- [DotNet Try](https://github.com/dotnet/try#setup)
- [dotnet-warp](https://github.com/Hubert-Rybak/dotnet-warp)

## DotNetCore Preview 7 tools

- CLI tool for managing gRPC code generation
```bash
    dotnet tool install --global dotnet-grpc --version 0.1.22-pre2
``` 

- EventCounters
```bash
    dotnet tool install --global dotnet-counters --version 3.0.0-preview7.19365.2
```

```bash
    dotnet tool install --global dotnet-warp --version 1.0.9

    dotnet-warp -l Aggressive
```
- https://devblogs.microsoft.com/aspnet/httprepl-a-command-line-tool-for-interacting-with-restful-http-services/
```
    dotnet tool install -g Microsoft.dotnet-httprepl --version "3.0.0-*
```
## Nuget

-[dotnet-outdated](https://github.com/jerriep/dotnet-outdated)

```bash
    dotnet tool install --global dotnet-outdated
```

## Let's Encrypt

-[dotnet-certes](https://github.com/fszlin/certes#cli)

```bash
    dotnet tool install --global dotnet-certes
```

## Performance and Tracing

- [Trace for performance analysis utility (dotnet-trace)](https://github.com/dotnet/diagnostics/blob/master/documentation/dotnet-trace-instructions.md)
- [Performance Tracing on Linux](https://github.com/dotnet/coreclr/blob/master/Documentation/project-docs/linux-performance-tracing.md)
