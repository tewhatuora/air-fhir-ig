# if you use Visual Studio Code and install "Container Tools" you shouldn't need this
# unless you are doing a bit of testing around the Docker build

docker build --target BASE --network host \
  --build-arg HTTPS_PROXY="http://10.120.112.54:3128/" \
  --build-arg HTTP_PROXY="http://10.120.112.54:3128/" \
  --build-arg NO_PROXY="localhost,127.0.0.1,.local,.internal" \
  -t air-api-fhir-ig-dev .devcontainer

docker build --target localdev --network host \
  --build-arg HTTPS_PROXY="http://10.120.112.54:3128/" \
  --build-arg HTTP_PROXY="http://10.120.112.54:3128/" \
  --build-arg NO_PROXY="localhost,127.0.0.1,.local,.internal" \
  --build-arg USERNAME=$(whoami) \
  --build-arg USER_UID=$(id -u) \
  --build-arg USER_GID=$(id -g) \
  -t air-api-fhir-ig-dev:devlocal .devcontainer

# docker run -v "$(pwd):/workspace" -w /workspace -it air-api-fhir-ig-dev:latest bash
# docker run -v "$(pwd):/workspace" -w /workspace -it air-api-fhir-ig-dev:devlocal bash
