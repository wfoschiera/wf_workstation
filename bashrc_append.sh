sudo tee -a $HOME/.bashrc <<'EOF'
fi
export PIPENV_VENV_IN_PROJECT=1
export PATH="$HOME/.pyenv/bin:$PATH"

alias mng='python $VIRTUAL_ENV/../manage.py'

eval "$(pyenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
-e if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
EOF