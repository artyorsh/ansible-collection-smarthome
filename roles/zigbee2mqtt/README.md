# smarthome.zigbee2mqtt

Installs the <a href="https://hub.docker.com/r/koenkk/zigbee2mqtt/" target="_blank">koenkk/zigbee2mqtt</a> image.

## Requirements

- A <a href="https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites" target="_blank">ZigBee Adapter</a>.
- An [MQTT server](../mosquitto/readme.md).

## Role Variables

- `zigbee2mqtt_version`
  - Default: `latest`
  - Description: The version of the Zigbee2MQTT image to install. See [published tags](https://hub.docker.com/r/koenkk/zigbee2mqtt/tags).
  - Type: str
  - Required: no
- `zigbee2mqtt_network`
  - Default: `zigbee2mqtt`
  - Description: The name of the Docker network.
  - Type: str
  - Required: no
- `zigbee2mqtt_port`
  - Default: `8124`
  - Description: The port for the Zigbee2MQTT WebUI.
  - Type: int
  - Required: no
- `zigbee2mqtt_install_dir`
  - Default: `/opt/docker/zigbee2mqtt`
  - Description: The directory where Zigbee2MQTT will be installed.
  - Type: str
  - Required: no
- `zigbee2mqtt_env`
  - Default: `{}`
  - Description: Docker container environment variables. See [zigbee2mqtt.io](https://www.zigbee2mqtt.io/guide/installation/02_docker.html#running-the-container).
  - Type: dict
  - Required: no
- `zigbee2mqtt_config`
  - Default: See [zigbee2mqtt_config_default](./vars/main.yml)
  - Description: Configuration for [configuration.yaml](https://www.zigbee2mqtt.io/guide/configuration/#configuration). **Must include** [server](https://www.zigbee2mqtt.io/guide/configuration/mqtt.html#server-connection) to operate.
  - Type: dict
  - Required: yes
- `zigbee2mqtt_device`
  - Default: ``
  - Description: Path to the ZigBee Adapter. See [requirements](#requirements).
  - Type: str
  - Required: yes

## Dependencies

- [community.docker](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)

## Example Playbook

```yaml
- hosts: localhost

  vars:
    zigbee2mqtt_device: "/dev/ttyUSB0"
    zigbee2mqtt_config:
      mqtt:
        server: "mqtt://mosquitto"
        user: "mosquitto"
        password: "changeme"

  roles:
    - artyorsh.smarthome.zigbee2mqtt
```
