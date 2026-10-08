#!//usr/bin/bash
docker build -t arq-comp-sumadores .
docker run -tdi --name arq-comp-sumadores arq-comp-sumadores && echo "Recuerda salir con Ctrl+P+Q" && docker attach arq-comp-sumadores