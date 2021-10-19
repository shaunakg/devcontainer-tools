export SERVICE_URL="https://marketplace.visualstudio.com/_apis/public/gallery"
export ITEM_URL="https://marketplace.visualstudio.com/items"

chmod +x /home/coder/tools/getext
ln -s /home/coder/tools/getext /usr/bin/getext

echo "Using Microsoft endpoints for extension install. Run getext to install extension, or use GUI"
