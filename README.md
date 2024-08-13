# Ansible Collection - artyorsh.smarthome

[![Test (Ubuntu 22.04)](https://github.com/artyorsh/ansible-collection-smarthome/actions/workflows/test-ubuntu-lts.yml/badge.svg?event=push)](https://github.com/artyorsh/ansible-collection-smarthome/actions/workflows/test-ubuntu-lts.yml)
[![Ansible Galaxy](https://img.shields.io/badge/collection-artyorsh.smarthome-blue)](https://galaxy.ansible.com/artyorsh/smarthome)

## Description

All-in-one installation scripts for a selfhosted [HomeAssistant](https://www.home-assistant.io) instance, with a purpose of making
Zigbee-based IoT devices accessible through Apple HomeKit.

## Tech stack

- [linuxserver/homeassistant](https://docs.linuxserver.io/images/docker-homeassistant)
- [koenkk/zigbee2mqtt](https://hub.docker.com/r/koenkk/zigbee2mqtt)
- [eclipse-mosquitto](https://hub.docker.com/_/eclipse-mosquitto)

## Requirements

A Zigbee Adapter. See [prerequisites](https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites).

## Installation

Install the collection via ansible-galaxy:

```
ansible-galaxy collection install git+https://github.com/artyorsh/ansible-role-smarthome.git,master
```

## Using this collection

Please refer to the example in [smarthome/readme.md](./roles/smarthome/readme.md#example-playbook) for all-in-one installation.

...Or to [homeassistant/readme.md](./roles/homeassistant/readme.md#example-playbook),
[zigbee2mqtt/readme.md](./roles/zigbee2mqtt/readme.md#example-playbook)
and [mosquitto/readme.md](./roles/mosquitto/readme.md#example-playbook)
for installing containers individually.

## More information

- [Ansible User guide](https://docs.ansible.com/ansible/latest/user_guide/index.html)
- [HomeAssistant Docker](https://www.home-assistant.io/installation/linux#docker-compose)
- [HomeAssistant HomeKit Bridge](https://www.home-assistant.io/integrations/homekit)
- [Zigbee2MQTT Getting started](https://www.zigbee2mqtt.io/guide/getting-started)
- [Zigbee2MQTT Docker](https://www.zigbee2mqtt.io/guide/installation/02_docker.html)
- [Using HomeKit component inside docker](https://community.home-assistant.io/t/using-homekit-component-inside-docker/45409/45?page=2)

## License

MIT
