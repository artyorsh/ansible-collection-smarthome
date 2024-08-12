# smarthome

All-in-one role to install [homeassistant](../homeassistant/readme.md), [mosquitto](../mosquitto/readme.md) and [zigbee2mqtt](../zigbee2mqtt/readme.md).

## Requirements

- A Zigbee Adapter. See [prerequisites](https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites).

## Role Variables

- `smarthome_user`
  - Default: `{ name: "{{ ansible_user }}", password: "smarthome" }`
  - Description: Overrides [mosquitto_user](../mosquitto/readme.md#role-variables) and [zigbee2mqtt_user](../zigbee2mqtt/readme.md#role-variables)
  - Type: { name: str; password: str }
  - Required: no
- `smarthome_zigbee_coordinator`
  - Default: `{ name: "{{ ansible_user }}", password: "smarthome" }`
  - Description: Overrides [zigbee2mqtt_device](../zigbee2mqtt/readme.md#role-variables)
  - Type: str
  - Required: yes
- `smarthome_docker_settings`
  - Default: `{ network: "host", puid: "1000", pgid: "1000", tz: "Etc/UTC" }`
  - Description: Overrides [homeassistant_docker_settings](../homeassistant/readme.md#role-variables) [mosquitto_docker_settings](../mosquitto/readme.md#role-variables) and [zigbee2mqtt_docker_settings](../zigbee2mqtt/readme.md#role-variables)
  - Type: { network: str; puid: int; pgid: int; tz: str }
  - Required: no

## Dependencies

- [community.general](https://docs.ansible.com/ansible/latest/collections/community/general/index.html)

## Example Playbook

```yaml
- role: "artyorsh.smarthome.smarthome"
  vars:
    smarthome_user:
      name: "{{ ansible_user }}"
      password: "changeme"
    smarthome_zigbee_coordinator: "/dev/ttyUSB0"
    smarthome_docker_settings:
      network: "smarthome"
      puid: 1000
      pgid: 1000
      tz: "Europe/Berlin"
    homeassistant_mdns_host_network_interface: "eth0"
    homeassistant_homekit_host_ip: "{{ ansible_host }}"
    homeassistant_mdns_docker_network_interface: br-*** // Override
```
