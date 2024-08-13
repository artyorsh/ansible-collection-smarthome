# smarthome.homeassistant

Builds and installs a custom [lscr.io/linuxserver/homeassistant](https://hub.docker.com/r/linuxserver/homeassistant) image, discoverable in a bridge network ([See comments](https://community.home-assistant.io/t/using-homekit-component-inside-docker/45409/45?page=2) from [@irvinlim](https://github.com/irvinlim)).

Also installs [angelnu/mdns_repeater](https://github.com/angelnu/docker-mdns_repeater), to allow the container to send/receive mdns broadcast messages.

## Role Variables

- `homeassistant_port`
  - Default: `8123`
  - Description:
  - Type: int
  - Required: no
- `homeassistant_install_dir`
  - Default: `/opt/docker/`
  - Description:
  - Type: str
  - Required: no
- `homeassistant_trusted_proxies`
  - Default: `[]`
  - Description: `[{ desc: "cloudflare", address: "172.19.0.4" }]
  - Type: Array<{ desc: str; address: str }>
  - Required: no
- `homeassistant_homekit_host_ip`
  - Default: `192.168.0.1`
  - Description: mDNS advertisement address. [See docs](https://www.home-assistant.io/integrations/homekit/#advertise_ip)
  - Type: str
  - Required: no
- `homeassistant_homekit_port`
  - Default: `21063`
  - Description: Port for the HomeKit extension. [See docs](https://www.home-assistant.io/integrations/homekit/#port).
  - Type: int
  - Required: no
- `homeassistant_mdns_host_network_interface`
  - Default: `eth0`
  - Description:
  - Type: str
  - Required: yes
- `homeassistant_mdns_docker_network_interface`
  - Default: `br-f4834f481234`
  - Description: Interface name on which the HA container is running. [See discussion](https://community.home-assistant.io/t/using-homekit-component-inside-docker/45409/45?page=2).
  - Type: str
  - Required: yes
- `homeassistant_homekit_devices`
  - Default: `[]`
  - Description:
  - Type: Array<str>
  - Required: no
- `homeassistant_docker_settings`
  - Default: `{ network: "host", puid: "1000", pgid: "1000", tz: "Etc/UTC" }`
  - Description: HA entities to share with HomeKit. [See docs](https://www.home-assistant.io/integrations/homekit/#include_entities).
  - Type: Array<{ network: str; puid: int; pgid: int; tz: str }>
  - Required: no

## Dependencies

- [community.general](https://docs.ansible.com/ansible/latest/collections/community/general/index.html)

## Example Playbook

```yaml
- role: "artyorsh.smarthome.homeassistant"
  vars:
    homeassistant_homekit_host_ip: "{{ ansible_host }}"
    homeassistant_mdns_docker_network_interface: br-*** // Override
    homeassistant_docker_settings:
      network: "smarthome"
      puid: 1000
      pgid: 1000
      tz: "Europe/Berlin"
```
