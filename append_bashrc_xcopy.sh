sudo apt install xclip
sudo tee -a $HOME/.bashrc <<'EOF'

# cria um atalho chamado c para copiar saidas para uso no terminal
export alias "c=xclip"
# cola no terminal
export alias "v=xclip -o"
# copia para ser utilizado no ambiente grafico tb
export alias "copy=xclip -selection clipboard"

EOF
