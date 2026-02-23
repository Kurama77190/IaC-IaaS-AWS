# Ansible Role: System

Configuration système de base pour serveurs Ubuntu.

## Requirements

- Ubuntu 20.04+ (Focal/Jammy)
- Ansible 2.9+

## Role Variables

Définies dans `defaults/main.yml`:

```yaml
system_timezone: "Europe/Paris"
system_packages:
  - vim
  - git
  - curl
  - wget
  - htop
  - net-tools
  - ufw
  - fail2ban
```

## Dependencies

Aucune

## Example Playbook

```yaml
- hosts: servers
  become: yes
  roles:
    - role: system
```

## License

MIT
