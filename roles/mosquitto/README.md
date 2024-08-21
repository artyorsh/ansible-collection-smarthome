# smarthome.mosquitto

Installs the [eclipse-mosquitto](https://github.com/eclipse/mosquitto/tree/master/docker#docker-images) image.

## Role Variables

- `mosquitto_version`
  - Default: `latest`
  - Description: See [published tags](https://hub.docker.com/_/eclipse-mosquitto/tags)
  - Type: str
  - Required: no
- `mosquitto_port`
  - Default: `1883`
  - Description: MQTT listen port
  - Type: int
  - Required: no
- `mosquitto_websocket_port`
  - Default: `9001`
  - Description: MQTT WebSockets listen port
  - Type: int
  - Required: no
- `mosquitto_install_dir`
  - Default: `/opt/docker/mosquitto`
  - Description:
  - Type: str
  - Required: no
- `mosquitto_env`
  - Default: `{}`
  - Description: Docker container environment
  - Type: str
  - Required: no
- `mosquitto_user`
  - Default: `{ name: "{{ ansible_user }}", password: "mosquitto" }`
  - Description: Authentication for Mosquitto instance. [See docs](https://mosquitto.org/documentation/authentication-methods)
  - Type: { name: str; password: str }
  - Required: no

## Dependencies

- [community.docker](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)

## Example Playbook

```yaml
- role: "artyorsh.smarthome.mosquitto"
  vars:
    mosquitto_user:
      name: "mosquitto"
      password: "changeme"
```
