# smarthome.zigbee2mqtt

Installs the <a href="https://hub.docker.com/r/koenkk/zigbee2mqtt/" alt target="_blank">koenkk/zigbee2mqtt</a> image.

## Requirements

- A <a href="https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites" alt target="_blank">ZigBee Adapter</a>.
- An [MQTT server](../mosquitto/readme.md).

## Role Variables

- `zigbee2mqtt_version`
  - Default: `latest`
  - Description: The version of the Zigbee2MQTT image to install. See <a href="https://hub.docker.com/r/koenkk/zigbee2mqtt/tags" alt target="_blank">published tags</a>.
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
  - Description: Docker container environment variables. <a href="https://www.zigbee2mqtt.io/guide/installation/02_docker.html#running-the-container" alt target="_blank">zigbee2mqtt.io</a>.
  - Type: dict
  - Required: no
- `zigbee2mqtt_config`
  - Default: See [zigbee2mqtt_config_default](./vars/main.yml)
  - Description: Configuration for <a href="https://www.zigbee2mqtt.io/guide/configuration/#configuration" alt target="_blank">configuration.yaml</a>. **Must include** <a href="https://www.zigbee2mqtt.io/guide/configuration/mqtt.html#server-connection" alt target="_blank">server</a> to operate.
  - Type: dict
  - Required: yes
- `zigbee2mqtt_device`
  - Default: ``
  - Description: Path to the ZigBee Adapter. See [requirements](#requirements).
  - Type: str
  - Required: yes

## Dependencies

- <a href="https://docs.ansible.com/ansible/latest/collections/community/docker/index.html" alt target="_blank">community.docker</a>

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
