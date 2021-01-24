FROM mcr.microsoft.com/dotnet/core/sdk:3.0 as build

WORKDIR /build

COPY ./KubernetesSample/StockKube.sln .
COPY ./KubernetesSample/src/stockdata/StockData.csproj ./src/StockData/
COPY ./KubernetesSample/src/stockweb/StockWeb.csproj ./src/StockWeb/

RUN dotnet restore

COPY . .

RUN dotnet publish --no-restore -c Release -o /published src/StockData/StockData.csproj

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0

WORKDIR /app

COPY --from=build /published .

ENTRYPOINT [ "dotnet", "StockData.dll" ]
