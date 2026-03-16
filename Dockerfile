

# Étape 1 : build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copier tout le projet
COPY . .

# Publier le projet .NET
RUN dotnet publish "RestApiMysqlSdk9.csproj" -c Release -o /app

# Étape 2 : runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app

# Copier les fichiers publiés
COPY --from=build /app .

# Lancer l'application
ENTRYPOINT ["dotnet", "RestApiMysqlSdk9.dll"]