FROM mcr.microsoft.com/dotnet/core/sdk:3.0 as build

WORKDIR /build

COPY ./StockKube.sln .
COPY ./src/stockdata/StockData.csproj ./src/stockdata/
COPY ./src/stockweb/StockWeb.csproj ./src/stockweb/

RUN dotnet restore

COPY . .

RUN dotnet publish --no-restore -c Release -o /published src/stockdata/StockData.csproj

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0

WORKDIR /app

COPY --from=build /published .

ENTRYPOINT [ "dotnet", "StockData.dll" ]
