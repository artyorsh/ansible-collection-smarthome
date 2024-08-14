# smarthome.homeassistant

Builds and installs a custom [lscr.io/linuxserver/homeassistant](https://hub.docker.com/r/linuxserver/homeassistant) image, discoverable in a bridge network ([See comments](https://community.home-assistant.io/t/using-homekit-component-inside-docker/45409/45?page=2) from [@irvinlim](https://github.com/irvinlim)).

Also installs [angelnu/mdns_repeater](https://github.com/angelnu/docker-mdns_repeater), to allow the container to send/receive mdns broadcast messages.

## Role Variables

- `homeassistant_port`
  - Default: `8123`
  - Description:
  - Type: int
  - Required: no
- `homeassistant_network`
  - Default: `homeassistant`
  - Description:
  - Type: str
  - Required: no
- `homeassistant_install_dir`
  - Default: `/opt/docker/homeassistant`
  - Description:
  - Type: str
  - Required: no
- `homeassistant_env`
  - Default: `{}`
  - Description: Docker container environment. See [linuxserver/homeassistant](https://docs.linuxserver.io/images/docker-homeassistant/#environment-variables-e)
  - Type: str
  - Required: no
- `homeassistant_config`
  - Default: See [homeassistant_config_default](./vars/main.yml)
  - Description: Configuration for [configuration.yaml](https://home-assistant.io/docs/configuration/)
  - Type: object
  - Required: no
- `homeassistant_homekit_config`
  - Default: See [homeassistant_homekit_config_default](./vars/main.yml)
  - Description: Configuration for [HomeKit integration](https://www.home-assistant.io/integrations/homekit)
  - Type: object
  - Required: no
- `homeassistant_mdns_host_network_interface`
  - Default: `eth0`
  - Description: Host network interface from which mDNS requests are sent to HomeAssistant container
  - Type: str
  - Required: no

## Dependencies

- [community.docker](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)

## Example Playbook

```yaml
- role: "artyorsh.smarthome.homeassistant"
```

### Include specific HomeAssistant entries

```yaml
- role: "artyorsh.smarthome.homeassistant"
  vars:
    homeassistant_homekit_config:
      filter:
        include_entity_globs: ["light.*"]
```
