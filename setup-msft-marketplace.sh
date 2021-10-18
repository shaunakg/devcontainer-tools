export SERVICE_URL="https://marketplace.visualstudio.com/_apis/public/gallery"
export ITEM_URL="https://marketplace.visualstudio.com/items"

function getext {
  code-server --install-extension $1
}

echo "Using Microsoft endpoints for extension install. Run getext to install extension, or use GUI"
export -f getext
