#!//usr/bin/bash
# Define the image and tag you want to check
IMAGE_NAME="arq-comp-sumadores"

# Inspect the image and silence the output
if docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
    echo "✅ La imagen '$IMAGE_NAME'existe localmente."
else
    echo "❌ Error: La imagen '$IMAGE_NAME' no existe localmente. Building..."
    docker build -t "$IMAGE_NAME" .
fi

clear
docker run -tdi --name "$IMAGE_NAME" "$IMAGE_NAME" && echo "Recuerda salir con Ctrl+P+Q" && docker attach "$IMAGE_NAME"