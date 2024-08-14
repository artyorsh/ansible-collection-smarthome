# smarthome.smarthome

All-in-one role to install [homeassistant](../homeassistant/readme.md), [mosquitto](../mosquitto/readme.md) and [zigbee2mqtt](../zigbee2mqtt/readme.md).

## Requirements

- A Zigbee Adapter. See [prerequisites](https://www.zigbee2mqtt.io/guide/getting-started/#prerequisites).

## Role Variables

- `smarthome_network`
  - Default: `smarthome`
  - Description: Overrides [homeassistant_network](../homeassistant/readme.md#role-variables) [mosquitto_network](../mosquitto/readme.md#role-variables) and [zigbee2mqtt_network](../zigbee2mqtt/readme.md#role-variables)
  - Type: str
  - Required: no
- `smarthome_user`
  - Default: `{ name: "{{ ansible_user }}", password: "smarthome" }`
  - Description: Overrides [mosquitto_user](../mosquitto/readme.md#role-variables) and [zigbee2mqtt_user](../zigbee2mqtt/readme.md#role-variables)
  - Type: { name: str; password: str }
  - Required: no
- `smarthome_zigbee_coordinator`
  - Default: ``
  - Description: Overrides [zigbee2mqtt_device](../zigbee2mqtt/readme.md#role-variables)
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
