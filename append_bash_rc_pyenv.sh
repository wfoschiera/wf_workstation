sudo tee -a $HOME/.bashrc <<'EOF'

export PIPENV_VENV_IN_PROJECT=1
export PATH="$HOME/.pyenv/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# seta ambiente para verificar se existe venv criado ou nao
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi
eval "$(pyenv virtualenv-init -)"

alias mng='python $VIRTUAL_ENV/../manage.py'
EOF
