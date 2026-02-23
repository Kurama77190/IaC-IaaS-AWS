# Ansible Role: Docker

Installation et configuration de Docker sur Ubuntu.

## Requirements

- Ubuntu 20.04+ (Focal/Jammy)
- Ansible 2.9+

## Role Variables

Définies dans `defaults/main.yml`:

```yaml
docker_users:
  - ubuntu

docker_packages:
  - docker-ce
  - docker-ce-cli
  - containerd.io
  - docker-compose-plugin
```

## Dependencies

- `system` role (géré automatiquement via meta/main.yml)

## Example Playbook

```yaml
- hosts: servers
  become: yes
  roles:
    - role: docker
```

## License

MIT
