# Configuração basica pós instalação UBUNTU
## Automatização de instalação do Ubuntu

Certique-se do arquivo ter permissões de execução.

Para utilizar o Script, basta rodar o comando:
`sudo ./post_install_UBUNTU.sh`

Depois de executar, dar um append do conteúdo do bashrc.txt para o ~/.bashrc. Esses comandos
irão exportar as variáveis de ambiente (pipenv e pyenv) e criar o alias `mng` para python manage.py dentro do django. 

Inspirado no bash do
[Dio Linux](https://github.com/Diolinux/gabrielworkstation)


Implementar:
- paths no .bashrc
- revisar configurações python + django
- automatizar configuração vscode


