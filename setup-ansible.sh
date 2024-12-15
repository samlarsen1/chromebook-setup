
if ! command -v ansible >/dev/null 2>&1; then
  echo "Ansible is not installed.  Installing now ..."
  sudo apt update
  sudo apt install ansible -y
fi

ansible --version | head -n 1