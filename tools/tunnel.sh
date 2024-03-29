
echo "=== Setting up tunnelling and port forward tools ==="
echo "[INFO] Installing Cloudflare Tunnel"

curl -L -o "cftunnel.deb" "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb"
dpkg -i cftunnel.deb
rm -f cftunnel.deb

echo "[INFO] Cloudflare Tunnel installed."
echo "[ACTN] Please login with your Cloudflare account!"

cloudflared tunnel login

echo "[INFO] Login complete."

chmod +x /root/tools/mktun
ln -s /root/tools/mktun /usr/bin/mktun

echo "[INFO] Tunnel is good to go!"
echo "Use tunnel functionality like this:"
echo "    mktun 8080 mytunnel"
echo "to forward localhost:8080 to http://devtunnel-mytunnel.srg.id.au"
