#!/usr/bin/env bash

# Função para imprimir mensagens informativas com formatação
function log_info() {
  echo -e "\e[32m[INFO]\e[0m $1"
}

# Função para imprimir mensagens de erro com formatação
function log_error() {
  echo -e "\e[31m[ERROR]\e[0m $1"
}

# Função para realizar as atualizações
function update_system() {
  log_info "Updating and upgrading packages..."
  sudo yum update -y > /dev/null 2>&1
  sudo yum upgrade -y > /dev/null 2>&1
}

# Função principal que executa as etapas de instalação
function main() {
  # Atualiza todos os servidores
  update_system

# Função para imprimir mensagens informativas com formatação
function log_info() {
  local TARGET_SERVER="srv-vm-node01"
  local CURRENT_SERVER=$(hostname)

  # Verifica se o servidor atual é o servidor alvo
  if [ "$CURRENT_SERVER" == "$TARGET_SERVER" ]; then
    echo -e "\e[32m[INFO]\e[0m $1"
  fi
}

# Instala o Ansible apenas no servidor alvo
log_info "Installing Ansible on $TARGET_SERVER..."
sudo yum -y install epel-release -y > /dev/null 2>&1
sudo yum -y install ansible -y > /dev/null 2>&1

  # Adicionando chave ssh
  # log_info "Adding ssh key..."
  # cp ~/.ssh/id_rsa.pub /home/vagrant/.ssh/authorized_keys && \
  # chown -R vagrant:vagrant /home/vagrant/.ssh && \
  # chmod 700 /home/vagrant/.ssh && \
  # chmod 600 /home/vagrant/.ssh/authorized_keys


  # Adicionando entradas no arquivo /etc/hosts
  log_info "Adding hosts file..."
echo -e "192.168.56.11 control-node\n192.168.56.12 app01\n192.168.56.13 db01" | sudo tee -a /etc/hosts > /dev/null


  log_info "Installation completed."
}

# Chamando a função principal
main
