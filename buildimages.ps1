docker build -t stockdata:1.0.0 -f .\src\stockdata\Dockerfile ./src/stockdata
docker build -t stockweb:1.0.0 -f .\src\stockweb\Dockerfile ./src/stockweb
