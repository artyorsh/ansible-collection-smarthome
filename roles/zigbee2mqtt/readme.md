# artyorsh.smarthome.zigbee2mqtt

Installs the [koenkk/zigbee2mqtt](https://hub.docker.com/r/koenkk/zigbee2mqtt/) image.

## Requirements

- A Zigbee Adapter. See [prerequisites](https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites).
- An MQTT server. See [mosquitto role](../mosquitto/readme.md).

## Role Variables

- `zigbee2mqtt_version`
  - Default: `latest`
  - Description: See [published tags](https://hub.docker.com/r/koenkk/zigbee2mqtt/tags)
  - Type: str
  - Required: no
- `zigbee2mqtt_port`
  - Default: `8124`
  - Description: Application WebUI
  - Type: int
  - Required: no
- `zigbee2mqtt_install_dir`
  - Default: `/opt/docker/`
  - Description:
  - Type: str
  - Required: no
- `zigbee2mqtt_device`
  - Default: ``
  - Description: Path to Zigbee Adapter. See [requirements](#requirements).
  - Type: str
  - Required: yes
- `zigbee2mqtt_broker_address`
  - Default: `172.19.0.1`
  - Description: Address of the [MQTT server](../mosquitto/readme.md#example-playbook)
  - Type: str
  - Required: no
- `zigbee2mqtt_broker_user`
  - Default: `{ name: "{{ ansible_user }}", password: "mosquitto" }`
  - Description: Auth user of the MQTT server. See [mosquitto](../mosquitto/readme.md#role-variables)
  - Type: { name: str; password: str }
  - Required: no
- `zigbee2mqtt_docker_settings`
  - Default: `{ network: "host", puid: "1000", pgid: "1000", tz: "Etc/UTC" }`
  - Description:
  - Type: { network: str; puid: int; pgid: int; tz: str }
  - Required: no

## Dependencies

- [community.general](https://docs.ansible.com/ansible/latest/collections/community/general/index.html)

## Example Playbook

```yaml
- role: "artyorsh.smarthome.zigbee2mqtt"
  vars:
    zigbee2mqtt_device: "/dev/ttyUSB0"
    zigbee2mqtt_broker_address: "mosquitto"
    zigbee2mqtt_broker_user:
      name: "{{ ansible_user }}"
      password: "changeme"
    zigbee2mqtt_docker_settings:
      network: "smarthome"
      puid: 1000
      pgid: 1000
      tz: "Europe/Berlin"
```
