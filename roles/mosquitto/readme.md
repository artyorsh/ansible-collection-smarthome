# artyorsh.smarthome.mosquitto

Installs the [eclipse-mosquitto](https://hub.docker.com/_/eclipse-mosquitto) image.

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
  - Default: `/opt/docker`
  - Description:
  - Type: str
  - Required: no
- `mosquitto_user`
  - Default: `{ name: "{{ ansible_user }}", password: "mosquitto" }`
  - Description: Authentication for Mosquitto instance. [See docs](https://mosquitto.org/documentation/authentication-methods)
  - Type: { name: str; password: str }
  - Required: no
- `mosquitto_docker_settings`
  - Default: `{ network: "host", puid: "1000", pgid: "1000", tz: "Etc/UTC" }`
  - Description: Authentication for Mosquitto instance. [See docs](https://mosquitto.org/documentation/authentication-methods)
  - Type: { network: str; puid: int; pgid: int; tz: str }
  - Required: no

## Dependencies

- [community.general](https://docs.ansible.com/ansible/latest/collections/community/general/index.html)

## Example Playbook

```yaml
- role: "artyorsh.smarthome.mosquitto"
  vars:
    mosquitto_user:
      name: "{{ ansible_user }}"
      password: "changeme"
    mosquitto_docker_settings:
      network: "smarthome"
      puid: 1000
      pgid: 1000
      tz: "Europe/Berlin"
```
