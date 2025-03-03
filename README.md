# Ansible Collection - Smarthome

[![Ansible Galaxy](https://img.shields.io/badge/collection-artyorsh.smarthome-blue)](https://galaxy.ansible.com/artyorsh/smarthome)
[![Home Assistant](https://img.shields.io/badge/homeassistant-2025.2.5-blue)](https://github.com/home-assistant/core/releases/tag/2025.2.5)
[![Test (Ubuntu 22.04)](https://github.com/artyorsh/ansible-collection-smarthome/actions/workflows/test-ubuntu-lts.yml/badge.svg?event=push)](https://github.com/artyorsh/ansible-collection-smarthome/actions/workflows/test-ubuntu-lts.yml)

Effortlessly connect your IoT infrastructure to Apple Home ✨

## Description

This collection is a set of Ansible roles, aiming to simplify the deployment and configuration
of [HomeAssistant](https://home-assistant.io),
[Zigbee2MQTT](https://www.zigbee2mqtt.io)
and [Mosquitto](https://mosquitto.org),
making them ready to connect to Apple Home.

## Requirements

- A [ZigBee Adapter](https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites).
- Docker. Please refer to [ansible-role-docker](https://github.com/geerlingguy/ansible-role-docker?tab=readme-ov-file#ansible-role-docker) to install it with Ansible.

## Installation

```
ansible-galaxy collection install artyorsh.smarthome
```

## Usage

1. [Find the ZigBee adapter](https://www.zigbee2mqtt.io/guide/getting-started/#installation)
2. [Run the playbook](#example-playbook)
3. Open HomeAssistant frontend and complete the setup (localhost:8123)
4. [Enable the MQTT integration](https://www.home-assistant.io/integrations/mqtt/#broker-configuration) (broker: "mosquitto", port: 1883)
5. Open Zigbee2MQTT frontend and pair the devices (localhost:8124)
6. Restart HomeAssistant
7. [Pair with Apple Home](https://www.home-assistant.io/integrations/homekit/#setup) (starting from step 1)

For a real-world usage example, see my [infra playbooks](https://github.com/artyorsh/infra).

## Example Playbook

```yaml
- hosts: localhost

  vars:
    smarthome_zigbee_adapter: /dev/ttyUSB0
    smarthome_user: { name: "myuser", password: "changeme" }
    # homeassistant_mdns_host_network_interface: wlan0 # running on wlan?

  roles:
    - artyorsh.smarthome.smarthome
```

By default, HomeAssistant and Zigbee2MQTT containers are deployed on ports 8123 and 8124.

## Configuration

- The [smarthome role](./roles/smarthome/README.md) is a shortcut to deploy everything in one go
- Please refer to the role documentation pages for more configuration options:
  - [homeassistant](./roles/homeassistant/README.md)
  - [zigbee2mqtt](./roles/zigbee2mqtt/README.md)
  - [mosquitto](./roles/mosquitto/README.md)

## License

MIT
