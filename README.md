# Welcome to your devcontainer
This repository will be cloned into `/root/tools` on any devcontainer created using https://dev.srg.id.au. Many of these files and scripts are used during the provisioning of the container and do not need to be run again.

## Files
### `devtools.sh`
This sets up popular programming languages and platforms on the container, such as NodeJS, Docker, Python and Go. It also will install extensions into the VSCode instance which are defined in `extensions.json`.

This script should be pretty much idempotent, but there is not much need to run it multiple times. There is no guarantee that the installed services will be upgraded if you run it once again - for example, the Go binary URL is hard coded to the version. To update, follow the individual update process for the service you want.

#### Note: Docker-In-Docker
Docker is setup on the container, and `/var/run/docker.sock` on the host is mounted to the code server. This allows for the running of arbitrary images. Be careful not to stop the `code-server` container however, it will disconnect you and since `restart: unless-stopped` is set, the container will not auto-restart. Instead, you can control the host's restart behaviour through https://dev.srg.id.au.

### `tunnel.sh`
This script sets up Cloudflare tunnel and requires interactivity (so it's not automatically run on startup). It will download `cloudflared`, authorize you with it and then symlink the `mktun` script. After running this, you can run `mktun <port> <name>` at any time to create a tunnel that will forward the `<port>` to `https://devtunnel--<name>.srg.id.au`. This link is public - don't host sensitive information.

#### Note: accessing containers through Tailscale's internal VPN
Since 06-11-2021, all container hosts are automatically enrolled on setup through Tailscale and have logging setup to forward to an internal Elasticsearch + Kibana server, for monitoring. Due to this, you may access internal IPs through the instance (like normal).

With the introduction of Tailscale auto-enrollment, you may want to not port forward and instead just access the exposed port via the container's Tailscale internal IP address, which can be found in the console: https://login.tailscale.com/admin/machines. If your client device is not enrolled in the VPN, then you will not be able to do this.

### `startup.txt`
This message is shown on every terminal opened in the devcontainer. To disable this behaviour, simply run `printf "" > /root/tools/startup.txt`, or edit `/root/.bashrc`.
