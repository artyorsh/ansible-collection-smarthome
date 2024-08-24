# Ansible Collection - Smarthome

[![Ansible Galaxy](https://img.shields.io/badge/collection-artyorsh.smarthome-blue)](https://galaxy.ansible.com/artyorsh/smarthome)
[![Test (Ubuntu 22.04)](https://github.com/artyorsh/ansible-collection-smarthome/actions/workflows/test-ubuntu-lts.yml/badge.svg?event=push)](https://github.com/artyorsh/ansible-collection-smarthome/actions/workflows/test-ubuntu-lts.yml)

Effortlessly connect your IoT infrastructure to Apple Home ✨

## Description

This collection is a set of Ansible roles, aiming to simplify the deployment and configuration
of <a href="https://home-assistant.io" alt target="_blank">HomeAssistant</a>,
<a href="https://www.zigbee2mqtt.io" alt target="_blank">Zigbee2MQTT</a>
and <a href="https://mosquitto.org" alt target="_blank">Mosquitto</a>,
making them ready to connect to Apple Home.

## Requirements

- A <a href="https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites" alt target="_blank">ZigBee Adapter</a>.
- Docker. Please refer to <a href="https://github.com/geerlingguy/ansible-role-docker?tab=readme-ov-file#ansible-role-docker" alt target="_blank">ansible-role-docker</a> to install it with Ansible.

## Installation

```
ansible-galaxy collection install artyorsh.smarthome
```

## Usage

<!-- TODO: enable mqtt in HA by default! -->
<!-- see https://www.home-assistant.io/integrations/alarm_control_panel.mqtt/#state_topic -->
<!-- see https://www.home-assistant.io/integrations/alarm_control_panel.mqtt/#command_topic -->

1. <a href="https://www.zigbee2mqtt.io/guide/getting-started/#installation" alt target="_blank">Find the ZigBee adapter</a>
2. [Run the playbook](#example-playbook)
3. <a href="https://www.home-assistant.io/integrations/homekit/#setup" alt target="_blank">Enable the HomeKit integration in AppleHome</a> (starting from step 1)

For a real-world usage example, see my <a href="https://github.com/artyorsh/infra" alt target="_blank">infra playbooks</a>.

## Example Playbook

```yaml
- hosts: localhost

  vars:
    smarthome_zigbee_coordinator: /dev/ttyUSB0

  roles:
    - artyorsh.smarthome.smarthome
```

By default, HomeAssistant and Zigbee2MQTT containers are deployed on ports 8123 and 8124.

## Configuration

- The [smarthome](./roles/smarthome/README.md) role is a shortcut to deploy everything in one go
- Please refer to the role documentation pages for more configuration options:
  - [homeassistant](./roles/homeassistant/README.md)
  - [zigbee2mqtt](./roles/zigbee2mqtt/README.md)
  - [mosquitto](./roles/mosquitto/README.md)

## More information

- <a href="https://docs.ansible.com/ansible/latest/user_guide/index.html" alt target="_blank">Ansible User guide</a>
- <a href="https://www.home-assistant.io/integrations/homekit" alt target="_blank">HomeAssistant / HomeKit Integration</a>
- <a href="https://community.home-assistant.io/t/using-homekit-component-inside-docker/45409/45?page=2" alt target="_blank">Using HomeKit component inside docker</a>

## License

MIT
