# smarthome.smarthome

An all-in-one role to install [HomeAssistant](../homeassistant/readme.md), [Mosquitto](../mosquitto/readme.md), and [Zigbee2MQTT](../zigbee2mqtt/readme.md).

## Requirements

- A Zigbee Adapter. See [prerequisites](https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites).

## Role Variables

- `smarthome_network`
  - Default: `smarthome`
  - Description: Overrides the network for [HomeAssistant](../homeassistant/readme.md#role-variables), [Mosquitto](../mosquitto/readme.md#role-variables), and [Zigbee2MQTT](../zigbee2mqtt/readme.md#role-variables).
  - Type: str
  - Required: no
- `smarthome_user`
  - Default: `{ name: "{{ ansible_user }}", password: "smarthome" }`
  - Description: Overrides the users for [Mosquitto](../mosquitto/readme.md#role-variables) and [Zigbee2MQTT](../zigbee2mqtt/readme.md#role-variables).
  - Type: dict with keys `name` (str) and `password` (str)
  - Required: no
- `smarthome_zigbee_coordinator`
  - Default: ``
  - Description: Specifies the Zigbee coordinator device. Overrides [zigbee2mqtt_device](../zigbee2mqtt/readme.md#role-variables).
  - Type: str
  - Required: yes

## Dependencies

- [community.docker](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html)

## Example Playbook

```yaml
- role: "artyorsh.smarthome.smarthome"
  vars:
    smarthome_zigbee_coordinator: "/dev/ttyUSB0"
    smarthome_user: { name: "smarthome", password: "changeme" }
```

### Custom settings for individual containers

```yaml
- role: "artyorsh.smarthome.smarthome"
  vars:
    smarthome_zigbee_coordinator: "/dev/ttyUSB0"
    smarthome_user: { name: "smarthome", password: "changeme" }
    homeassistant_homekit_config:
      filter:
        include_entity_globs: ["light.*"]
```
