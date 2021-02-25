#!/bin/bash
# ----------------------------- VARIÁVEIS ----------------------------- #

EXTENSIONS=(
alexcvzz.vscode-sqlite
chris-noring.node-snippets
Compulim.vscode-express
dbaeumer.vscode-eslint
EditorConfig.EditorConfig
ExpressSnippets.vscode-express-snippets
formulahendry.code-runner
formulahendry.terminal
mikestead.dotenv
ms-python.python
ms-toolsai.jupyter
naumovs.color-highlight
PKief.material-icon-theme
rocketseat.theme-omni
steoates.autoimport
streetsidesoftware.code-spell-checker
yzhang.markdown-all-in-one
)

# Instalar as extensoes no vscode
for EXTENSION in "${EXTENSIONS[@]}"
do
  if ! code --list-extensions | grep "$EXTENSION"
    then # Só instala se já não estiver instalado
    echo "Instalando... $EXTENSION"
    code --install-extension $EXTENSION && echo -e "[Instalado com sucesso!]\n"
  else
    echo "[INSTALADO] - $EXTENSION"
  fi
done

