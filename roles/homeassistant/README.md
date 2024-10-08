# smarthome.homeassistant

Installs the [lscr.io/linuxserver/homeassistant](https://hub.docker.com/r/linuxserver/homeassistant) image. Modifies the Dockerfile to enable avahi-tools.

[Why to modify the Dockerfile?](#why-to-modify-the-dockerfile)

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

## Why to modify the Dockerfile?

Running HomeAssistant in a Docker bridge network causes issues with the discoverability of the HomeKit integration by Apple Home. This is because HomeKit relies on mDNS for device discovery, which doesn't work out of the box across Docker's bridge network due to the way Docker handles networking. By [enabling Avahi tools](./templates/homeassistant-avahi-dockerfile.j2), which provide mDNS services, the HomeAssistant container can broadcast its presence on the network, making it discoverable by Apple Home. For more details, please refer to this [community thread](https://community.home-assistant.io/t/using-homekit-component-inside-docker/45409/45?page=2).

### Why to run in a bridge network?

Running in a bridge network provides isolation between the Docker containers and the host machine, which enhances the security of IoT infrastructure.
It allows containers to communicate with each other while keeping them isolated from the host's network.

### Is it still possible to run it in the host network?

Yes, it is.
In this case, mDNS replication and customization of HomeAssistant image are not required.
