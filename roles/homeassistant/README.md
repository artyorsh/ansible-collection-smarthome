# smarthome.homeassistant

Builds and install a custom <a href="https://hub.docker.com/r/linuxserver/homeassistant" target="_blank">lscr.io/linuxserver/homeassistant</a> image.

## Why a Custom Image?

When HomeAssistant is deployed in a bridge network, the HomeKit integration is not discoverable by Apple Home. To resolve this, the HomeAssistant image is built using the original LinuxServer image with [avahi-tools enabled](./templates/homeassistant-avahi-dockerfile.j2). For more details, please refer to this <a href="https://community.home-assistant.io/t/using-homekit-component-inside-docker/45409/45?page=2" target="_blank">community thread</a>.

## Role Variables

- `homeassistant_port`
  - Default: `8123`
  - Description: The port on which HomeAssistant will be accessible.
  - Type: int
  - Required: no
- `homeassistant_network`
  - Default: `homeassistant`
  - Description: The name of the Docker network.
  - Type: str
  - Required: no
- `homeassistant_install_dir`
  - Default: `/opt/docker/homeassistant`
  - Description: The directory where HomeAssistant will be installed.
  - Type: str
  - Required: no
- `homeassistant_env`
  - Default: `{}`
  - Description: Docker container environment variables. See [linuxserver/homeassistant](https://docs.linuxserver.io/images/docker-homeassistant/#environment-variables-e).
  - Type: dict
  - Required: no
- `homeassistant_config`
  - Default: See [homeassistant_config_default](./vars/main.yml)
  - Description: Configuration for [configuration.yaml](https://home-assistant.io/docs/configuration/).
  - Type: dict
  - Required: no
- `homeassistant_homekit_config`
  - Default: See [homeassistant_homekit_config_default](./vars/main.yml)
  - Description: Configuration for the [HomeKit integration](https://www.home-assistant.io/integrations/homekit).
  - Type: dict
  - Required: no
- `homeassistant_mdns_host_network_interface`
  - Default: `eth0`
  - Description: The host network interface from which mDNS requests are sent to the HomeAssistant container.
  - Type: str
  - Required: no

## Dependencies

- [community.docker](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)

## Example Playbook

```yaml
- hosts: localhost

  roles:
    - artyorsh.smarthome.homeassistant
```

### Only include specific HomeAssistant entries

```yaml
- hosts: localhost

  vars:
    homeassistant_homekit_config:
      filter:
        include_entity_globs: ["light.*"]

  roles:
    - artyorsh.smarthome.homeassistant
```
