# smarthome.mosquitto

Installs the <a href="https://github.com/eclipse/mosquitto/tree/master/docker#docker-images" alt target="_blank">eclipse-mosquitto</a> image.

## Role Variables

- `mosquitto_version`
  - Default: `latest`
  - Description: The version of the Mosquitto image to install. See <a href="https://hub.docker.com/_/eclipse-mosquitto/tags" alt target="_blank">published tags</a>.
  - Type: str
  - Required: no
- `mosquitto_port`
  - Default: `1883`
  - Description: The MQTT listen port.
  - Type: int
  - Required: no
- `mosquitto_websocket_port`
  - Default: `9001`
  - Description: The MQTT WebSockets listen port.
  - Type: int
  - Required: no
- `mosquitto_install_dir`
  - Default: `/opt/docker/mosquitto`
  - Description: The directory where Mosquitto will be installed.
  - Type: str
  - Required: no
- `mosquitto_env`
  - Default: `{}`
  - Description: Docker container environment variables.
  - Type: dict
  - Required: no
- `mosquitto_user`
  - Default: `{ name: "{{ ansible_user }}", password: "mosquitto" }`
  - Description: Authentication credentials for the Mosquitto instance. <a href="https://mosquitto.org/documentation/authentication-methods" alt target="_blank">See docs</a>.
  - Type: dict with keys `name` (str) and `password` (str)
  - Required: no

## Dependencies

- <a href="https://docs.ansible.com/ansible/latest/collections/community/docker/index.html" alt target="_blank">community.docker</a>

## Example Playbook

```yaml
- hosts: localhost

  vars:
    mosquitto_user:
      name: "mosquitto"
      password: "changeme"

  roles:
    - artyorsh.smarthome.mosquitto
```
