#!/bin/bash

# ----------------------------- VARIÁVEIS ----------------------------- #
## optei por não instalar drivers de vídeo automaticamente
#PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"

## Não utilizo wine
#URL_WINE_KEY="https://dl.winehq.org/wine-builds/winehq.key"
#URL_PPA_WINE="https://dl.winehq.org/wine-builds/ubuntu/"

## Esse link do google chrome está aqui como exemplo de pacote .deb a ser instalado.
## Nesta versão específica, não será instalado nenhum arquivo .deb
#URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

## Dropbox e Pycharm serão instalados tar.gz. Enquanto o pycharm terá um pouco mais de intervenção
## o dropbox será automatico, precisando apenas rodar um comando ao término desse script (~/.dropbox-dist/dropboxd).
URL_PYCHARM_TAR_GZ="https://download.jetbrains.com/python/pycharm-community-2020.3.3.tar.gz"
URL_DROPBOX_TAR_GZ="https://www.dropbox.com/download?plat=lnx.x86_64"

DIRETORIO_DOWNLOADS="/$HOME/Downloads/programas"

PROGRAMAS_PARA_INSTALAR=(
apt-transport-https
aria2
atom
build-essential
beekeeper-studio
blt-dev
code
curl
docker
docker-compose
flameshot
guvcview
gettext
gh
git
libbz2-dev
libgdbm-dev
liblzma-dev
libncurses5-dev
libnss3-tools
libpq-dev
libreadline-dev
libsqlite3-dev
libssl-dev
llvm
nodejs
python3-dev
python3-pip
python3-venv
python3
qgis
software-properties-common
spotify-client
tcl-dev
tk-dev
vim
zlib1g-dev
)

# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock


## Adcionando repositórios de terceiros e ativando repositório Universe (util para Ubuntu live persistent)
sudo apt-add-repository universe

#sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
#wget -nc "$URL_WINE_KEY"
#sudo apt-key add winehq.key
#sudo apt-add-repository "deb $URL_PPA_WINE bionic main"

### Repo Github CLI
wget -qO - https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

### Repo Atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

### Repo VSCODE
#And enable the Visual Studio Code repository by typing:
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" &&
#Import the Microsoft GPG key using the following wget command :
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
#se ocorrer problema de chave publica, basta adicionar a chave publica usando o comando acima (padrao)

### Repo spotify
wget --quiet -O - https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

### Repo BeeKeeper
wget --quiet -O - https://deb.beekeeperstudio.io/beekeeper.key | sudo apt-key add -
echo "deb https://deb.beekeeperstudio.io stable main" | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list

## Criar pasta para download dos .debs
mkdir $DIRETORIO_DOWNLOADS

#sudo apt update;
# ---------------------------------------------------------------------- #

# ----------------------------- INSTALAÇÃO ----------------------------- #


# ------------------------------- PYTHON ------------------------------- #
## Instalando pacotes python3
pip3 install pandas pipenv jupyter
wget https://pyenv.run | bash
# ----------------------------- PACOTES SNAP ----------------------------- #

#optei por instalar o mínimo possível de pacotes SNAP. Até por isso o pycharm foi baixado e instalar via tar.gz.
## Instalando pacotes Snap ##
#sudo snap install slack --classic &&
#sudo snap install skype --classic &&
#sudo snap install code --classic &&
#sudo snap install --edge node --classic &&
sudo snap install insomnia &&
sudo snap install spotify &&
#sudo snap install wps-office-multilang &&

# ------------------------------- FLATHUB ------------------------------- #
## Não habilitei flathub no ubuntu
## Adicionando repositório Flathub ##
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

## Instalando Apps do Flathub ##
# sudo flatpak install flathub com.obsproject.Studio -y &&
# sudo flatpak install flathub com.sublimetext.three -y &&
# sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y &&

# -------------------------- DOWNLOADS EXTERNOS -------------------------- #
## PYCHARM
## Se o link parar de funcionar, verificar a versão atual no site oficial
#"https://www.jetbrains.com/pt-br/pycharm/download/download-thanks.html?platform=linux"
wget -c "$URL_PYCHARM_TAR_GZ"                      -P "$DIRETORIO_DOWNLOADS"

# ---------------------------------- .DEB --------------------------------- #
# Inserir quantos pacotes quanto necessários. O chrome está como exemplo.
# wget -c "$URL_GOOGLE_CHROME"       -P "$DIRETORIO_DOWNLOADS"
# Instalando programas baixados na etapa anteriors (Apenas .deb)
# Só executar se houver algum pacote .deb que foi baixado
# sudo dpkg -i "$DIRETORIO_DOWNLOADS"/*.deb

# ---------------------------------- PYCHARM --------------------------------- #
## Configuracao especial do pycharm (para não usar SNAP)

## Instalar pycharm apenas usuário local
#PYCHARM_DESKTOP="/usr/share/applications"

## Instalar pycharm todos usuários
PYCHARM_DESKTOP="$HOME/.local/share/applications/"

## Extrair tarball para pasta /opt (Recomendado), depois, criar link simbolico
sudo mkdir /opt/pycharm && sudo tar -xzf "$DIRETORIO_DOWNLOADS"/pycharm-community-*.tar.gz -C /opt/pycharm --strip-components=1

sudo tee $PYCHARM_DESKTOP/jetbrains-pycharm-ce.desktop <<ATALHO
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Community Edition
Icon=/opt/pycharm/bin/pycharm.svg
Exec="/opt/pycharm/bin/pycharm.sh" %f
Comment=Python IDE for Professional Developers
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce
StartupNotify=true
ATALHO

sudo chmod 644 $PYCHARM_DESKTOP/jetbrains-pycharm-ce.desktop

# ---------------------------------- DROPBOX --------------------------------- #
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
## Para finalizar a instalação do dropbox, será necessário executar o comando abaixo:
# ~/.dropbox-dist/dropboxd

# Instalar programas no apt
for nome_do_programa in "${PROGRAMAS_PARA_INSTALAR[@]}"; do
  if ! dpkg -l | grep -q "$nome_do_programa"; then # Só instala se não estiver instalado
    sudo apt install "$nome_do_programa" -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

# ---------------------- SOFTWARES WINDOWS - USANDO WINE --------------------- #
## Softwares alternativos Windows##
## Instalando Wine
#sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y

## GIMP e PhotoGIMP
# flatpak install flathub org.gimp.GIMP -y && wget -c https://doc-0s-1g-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/0v83rmt4mij9897co9ufvor2r1jcj1am/1567965600000/07452089978596344616/*/12i-ihCDSZelx30-oNHJaKAzUei1etsbS?e=download && unzip 12i-ihCDSZelx30-oNHJaKAzUei1etsbS?e=download && cd "PHOTOGIMP V2018 - DIOLINUX" && cd "PATCH" && mkdir -p /home/$USER/.var/app/org.gimp.GIMP/config/GIMP/2.10/ && cp -R * /home/$USER/.var/app/org.gimp.GIMP/config/GIMP/2.10/ &&
## Wine softwares ###
# wget -c https://uploads.treeunfe.me/downloads/instalar-freenfe.exe
#wine instalar-freenfe.exe ;

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
## Descomentar se utilizar flatpack
#flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #

echo "Finalizado"
echo -e "\n"
echo "# ------------------------- DROPBOX ------------------------- #"
echo "Para finalizar a instalação do dropbox, executar o comando: ~/.dropbox-dist/dropboxd"
echo -e "\n"
echo "# ------------------------- PYCHARM ------------------------- #"
echo "Se o pycharm não aparecer no Dash: cd /opt/pycharm/bin; ./pycharm.sh"
echo "O pycharm será executado, abrir um projeto > Tools > Create Desktop Entry"
