FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS base
MAINTAINER Alexandre Beato <alebeato9@gmail.com>
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /src
COPY * ./

WORKDIR /src/Healthcheck.API
RUN dotnet build -c Release -o /app

FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Healthcheck.API.dll"]