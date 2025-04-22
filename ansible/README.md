
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.31
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.32
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.40
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.41
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.42
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.43
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.44
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.45
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.46
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.47
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.48
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.49
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.50
ssh -i ~/.ssh/onemarc_rsa donutuse@192.168.8.51


ssh -i ~/.ssh/onemarc_rsa donutuse@bootstrap.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@haproxy.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-master01.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-master02.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-master03.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker01.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker02.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker03.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker04.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker05.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker06.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker07.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker08.onemarc.io
ssh -i ~/.ssh/onemarc_rsa donutuse@okd-worker09.onemarc.io

# Automatically add fingerprints to ~/.ssh/known_hosts

```bash
for host in bootstrap haproxy \
            okd-master{01..03} \
            okd-worker{01..09}; do
  fullhost="$host.onemarc.io"
  echo "Processing $fullhost..."
  
  # Get the fingerprint (for verification)
  fingerprint=$(ssh-keyscan -t rsa "$fullhost" 2>/dev/null | ssh-keygen -lf -)
  echo "Fingerprint: $fingerprint"
  
  # Add to known_hosts if not already present
  if ! ssh-keygen -F "$fullhost" -f ~/.ssh/known_hosts >/dev/null; then
    ssh-keyscan -t rsa "$fullhost" >> ~/.ssh/known_hosts 2>/dev/null
    echo "Added to known_hosts"
  else
    echo "Already exists in known_hosts"
  fi
done
```

# Update & Upgrade all nodes

```bash
ansible-playbook -i inventory/inventory.yml playbooks/apt-upgrade.yml
```

# Configure all nodes (including HAProxy)

```bash
ansible-playbook -i inventory/inventory.yml playbooks/okd-setup.yml
```

# Configure HAProxy separately

```bash
ansible-playbook -i inventory/inventory.yml playbooks/haproxy-setup.yml
```
