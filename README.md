# Scripts para configuração pós instalação. 
### UBUNTU 20.04

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![Open Source? Yes!](https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github)](https://github.com/Naereen/badges/)

Baixe os scripts ou clone este repositório. Na sua máquina, certique-se que o arquivo tem permissões de execução.
Se não tiver, antes de executá-lo:
```sh
sudo chmod +x nome_do_script.sh
```

###Instalando pacotes do Ubuntu 20.04 (Com pycharm e VsCode)
Para rodar o script, basta executar o comando:
```sh
sudo ./ubuntu_20-04_post_install.sh
```

###Ambiente DEV Django
Se utiliza django, pyenv ou pipenv, executar: 
```sh
sudo ./bashrc_append.sh
```
Este script irá exportar as variáveis de ambiente (pipenv e pyenv) e criar o alias `mng` para python manage.py do django.

###VS Code - Instalar extensões
```sh
sudo ./vscode_install_extensions.sh
```
Este script instalará algumas extensões do VS Code. 


#### Importante
- O script `append_bashrc.sh` deve ser executado uma única vez após a instalação. Executá-lo várias vezes fará com que os comandos fiquem duplicados no .bashrc.
- Os softwares, pacotes ou extensões estão listados em um array. Personalize conforme sua necessidade.

Inspirado no bash do
[Dio Linux](https://github.com/Diolinux/gabrielworkstation)

