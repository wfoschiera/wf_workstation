# Configuração basica pós instalação UBUNTU
## Automatização de instalação do Ubuntu

Certique-se do arquivo ter permissões de execução.

Para utilizar o Script, basta rodar o comando:
`sudo ./post_install_UBUNTU.sh`

Repositório utilizado como exemplo:
[Dio Linux](https://github.com/Diolinux/gabrielworkstation)


Implementar:
paths no .bashrc

fi
export PIPENV_VENV_IN_PROJECT=1
export PATH="/home/fox/.pyenv/bin:$PATH"

alias mng='python $VIRTUAL_ENV/../manage.py'

eval "$(pyenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
-e if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi


