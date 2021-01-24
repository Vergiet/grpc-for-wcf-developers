FROM mcr.microsoft.com/dotnet/core/sdk:3.0 as build

WORKDIR /src

COPY ./StockKube.sln .
COPY ./src/stockdata/StockData.csproj ./src/StockData/
COPY ./src/stockweb/StockWeb.csproj ./src/StockWeb/

RUN dotnet restore

COPY . .

RUN dotnet publish --no-restore -c Release -o /published src/stockweb/StockWeb.csproj

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0

WORKDIR /app

COPY --from=build /published .

ENTRYPOINT [ "dotnet", "StockWeb.dll" ]
