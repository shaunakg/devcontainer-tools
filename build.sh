
echo "Building image and tagging as latest!"
docker build -t ghcr.io/shaunakg/devcontainer-tools/devcontainer:latest . | tee -a "build-logs/build-$(date +%s%N).log"