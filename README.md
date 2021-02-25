# Configuração basica pós instalação UBUNTU
## Automatização de instalação do Ubuntu

Certique-se que o arquivo tem permissões de execução.
Se não tiver, antes de executá-lo:
```sh
sudo chmod +x nome_do_script.sh
```

Para utilizar o Script, basta rodar o comando:
```sh
sudo ./post_install_UBUNTU.sh
```
Se utiliza django, pyenv ou pipenv, executar: 
```sh
sudo ./append_bashrc.sh
```
Este script irá exportar as variáveis de ambiente (pipenv e pyenv) e criar o alias `mng` para python manage.py do django.

#### Importante
O script `append_bashrc.sh` deve ser executado uma única vez após a instalação. Executá-lo várias vezes fará com que os comandos fiquem duplicados no .bashrc.


Inspirado no bash do
[Dio Linux](https://github.com/Diolinux/gabrielworkstation)


TODO:
- revisar configurações python + django
- automatizar configuração vscode


