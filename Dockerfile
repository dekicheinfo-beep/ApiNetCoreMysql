
# Étape de build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .

# Spécifie le fichier .csproj
RUN dotnet publish "RestApiMysqlSdk9.csproj" -c Release -o /app

# Étape runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "RestApiMysqlSdk9.dll"]