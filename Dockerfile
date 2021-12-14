FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine AS base
MAINTAINER Alexandre Beato <alebeato9@gmail.com>
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["src/Healthcheck.API/Healthcheck.API.csproj", "Healthcheck.API/"]
RUN dotnet restore "Healthcheck.API/Healthcheck.API.csproj"
COPY ./src .
WORKDIR "/src/Healthcheck.API"
RUN dotnet build "Healthcheck.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Healthcheck.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Healthcheck.API.dll"]