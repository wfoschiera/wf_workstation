#!/bin/bash

# ----------------------------- VARIÁVEIS ----------------------------- #
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"

URL_PYCHARM_TAR_GZ="https://download.jetbrains.com/python/pycharm-community-2020.3.3.tar.gz"
URL_DROPBOX_TAR_GZ="https://www.dropbox.com/download?plat=lnx.x86_64"

DIRETORIO_DOWNLOADS="/$HOME/Downloads/programas"

PROGRAMAS_PARA_INSTALAR=(
python3
python3-pip
guvcview
docker
docker-compose
git
build-essential
libssl-dev
qgis
nodejs
code
atom
flameshot
)

# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock


## Adcionando repositórios de terceiros e ativando repositório Universe (util para Ubuntu live persistent)
sudo apt-add-repository universe

## Atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

## VSCODE
#And enable the Visual Studio Code repository by typing:
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" &&
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
#se ocorrer problema de chave publica, basta adicionar a chave publica usando o comando acima (padrao)

sudo apt update;


## Criar pasta para download dos .debs
mkdir $DIRETORIO_DOWNLOADS

## Instalar VSCODE
#Import the Microsoft GPG key using the following wget command :
sudo apt install software-properties-common apt-transport-https wget


## Instalando pacotes python3
pip3 install pandas, pipenv, jupyter

## Instalando pacotes Snap ##
#sudo snap install slack --classic &&
#sudo snap install skype --classic &&
#sudo snap install code --classic &&
#sudo snap install --edge node --classic &&
sudo snap install insomnia &&
sudo snap install spotify &&
#sudo snap install wps-office-multilang &&

## Adicionando repositório Flathub ##
#flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

## Instalando Apps do Flathub ##
#sudo flatpak install flathub com.obsproject.Studio -y &&
#sudo flatpak install flathub com.sublimetext.three -y &&
#sudo flatpak install flathub io.dbeaver.DBeaverCommunity -y &&

## Softwares que precisam de download externo ##
#se o link parar de funcionar, verificar a versão atual no site oficial
#"https://www.jetbrains.com/pt-br/pycharm/download/download-thanks.html?platform=linux"
wget -c "$URL_PYCHARM_TAR_GZ"                      -P "$DIRETORIO_DOWNLOADS"
#wget -cO dropbox.tar.gz "$URL_DROPBOX_TAR_GZ"      -P "$DIRETORIO_DOWNLOADS"
#Instalando programas baixados na etapa anteriors (Apenas .deb)
#Só executar se houver algum pacote .deb que foi baixado
#sudo dpkg -i "$DIRETORIO_DOWNLOADS"/*.deb

## Configuracao especial do pycharm
#%% Extrair tarball para pasta /opt (Recomendado), depois, criar link simbolico
sudo tar -xzf "$DIRETORIO_DOWNLOADS"/pycharm-community-*.tar.gz -C /opt &&  sudo ln -sf /opt/pycharm-community-2020.3.3/pycharm.sh /usr/bin/pycharm

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
#sudo tar -xzf "$DIRETORIO_DOWNLOADS"/dropbox.tar.gz  -C /opt &&  sudo ln -sf /opt/dropbox-dist/dropboxd /usr/bin/dropbox
#Se precisar executar manualmente:
# cd /opt/pycharm-*/bin && sh pycharm.sh
#configurar atalho no desktop (copiar linha por linha e clicar ENTER).
sudo tee /usr/share/applications/jetbrains-pycharm-ce.desktop <<ATALHO
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Community Edition
Icon=/opt/pycharm-community/bin/pycharm.png
Exec="/opt/pycharm-community/bin/pycharm.sh" %f
Comment=The Drive to Develop
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce
ATALHO

# Instalar programas no apt
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
    sudo apt install "$nome_do_programa" -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done

##Softwares alternativos Windows##
##GIMP e PhotoGIMP
#flatpak install flathub org.gimp.GIMP -y && wget -c https://doc-0s-1g-docs.googleusercontent.com/docs/securesc/ha0ro937gcuc7l7deffksulhg5h7mbp1/0v83rmt4mij9897co9ufvor2r1jcj1am/1567965600000/07452089978596344616/*/12i-ihCDSZelx30-oNHJaKAzUei1etsbS?e=download && unzip 12i-ihCDSZelx30-oNHJaKAzUei1etsbS?e=download && cd "PHOTOGIMP V2018 - DIOLINUX" && cd "PATCH" && mkdir -p /home/$USER/.var/app/org.gimp.GIMP/config/GIMP/2.10/ && cp -R * /home/$USER/.var/app/org.gimp.GIMP/config/GIMP/2.10/ &&

## Wine softwares ###
## wget -c https://uploads.treeunfe.me/downloads/instalar-freenfe.exe

#wine instalar-freenfe.exe ;

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #

echo "Finalizado"
echo "Para finalizar a instalação do dropbox, executar o comando: ~/.dropbox-dist/dropboxd"
