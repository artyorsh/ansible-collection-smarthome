# AGENTS.md — `artyorsh.smarthome`

Ansible collection for Home Assistant, Zigbee2MQTT, and Mosquitto (`roles/*`).

## Before editing

- Read the touched role’s `README.md` and `defaults/main.yml`.
- Zigbee adapter paths and credentials are environment-specific; keep them as variables, not literals.

## Validation

```bash
ansible-playbook .github/ansible/playbook-ci.yml --syntax-check
```
