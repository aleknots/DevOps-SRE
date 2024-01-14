#!/usr/bin/env bash

# Função para imprimir mensagens informativas com formatação
function log_info() {
  echo -e "\e[32m[INFO]\e[0m $1"
}

# Função para imprimir mensagens de erro com formatação
function log_error() {
  echo -e "\e[31m[ERROR]\e[0m $1"
}

# Função para imprimir mensagem sobre a atualização e o upgrade dos pacotes do sistema
function main() {
  log_info "Updating and upgrading packages..."
  yum update -y && yum upgrade -y >/dev/null 2>&1

# Função principal que executa as etapas de instalação do Apache
  log_info "Installing Apache..."
  yum install -y httpd >/dev/null 2>&1

# Função para copiar os arquivos HTML para o diretório raiz do Apache
  if [ $? -eq 0 ]; then
    log_info "Copying HTML files to Apache document root..."
    cp -r /vagrant/files/html/* /var/www/html/

# Função para iniciar o serviço Apache
    log_info "Starting Apache service..."
    systemctl start httpd.service

# Função para exibir mensagem de conclusão
    log_info "Installation completed. Access http://localhost:8080/"
  else
    log_error "Failed to install Apache. Check the logs for details."
  fi
}

# Chamando a função principal
main
