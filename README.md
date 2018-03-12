# HS-105 Automation

This project holds scripts for interacting with the TP-Link HS105 wifi smart outlet.
Right now, the script supports sending on and off commands only. The only other "function" that could be automated is switch setup/reset, which currently must be done through a smartphone app. This is considerably more complex, though, than the on/off functionality.

## Getting Started

The scirpts provided were written to run on a FreeBSD based system, but should be good to go on any system.

### Prerequisites

bash
nc

```
# FreeBSD
pkg install bash nc

# Debian
apt-get install bash nc

# Redhat
yum install bash nc
```

### Installing

No installation is required, just clone and execute.

```
./hs-105.sh hs-105-some-dns on
./hs-105.sh hs-105-some-dns off
```

### Usage Ideas

Add to HA-Bridge/bin to allow Harmony universal remote systems to access HS105 outlets masquerading as hue lights.

Add to cron to powercycle modem periodically.

I added it to a script executed by pfSense on reboot to powercycle my modem when the firewall restarts, as it has trouble authenticating WAN if the modem is turned on before the firewall.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
