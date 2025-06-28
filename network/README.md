# Networking configuration files

## Add sysctl config file to allow enable packet forwarding. 

This allows container packets to reach the internet.
Add 30-ipforward.conf to /etc/sysctl.d
Run this command to load the configuration files placed in /etc/sysctl.d:
```
sudo sysctl --system
```

### Add firewalld port config

Copy this file to /etc/firewalld/zones/public.xml

```
cp firewalld/public.xml /etc/firewalld/zones/public.xml
```
