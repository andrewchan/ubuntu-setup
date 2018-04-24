apps_path="$HOME/apps"
projects_path="$HOME/projects"
mkdir ${apps_path}
mkdir ${projects_path}

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y curl vim git wget

# setup Ultimate Vimrc https://github.com/amix/vimrc

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# setup TLP
# http://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html

sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get -y install tlp tlp-rdw
sudo apt-get -y install tp-smapi-dkms acpi-call-dkms

# install openjdk 9

openjdk_9_url="https://download.java.net/java/GA/jdk9/9.0.4/binaries/openjdk-9.0.4_linux-x64_bin.tar.gz"
openjdk_9_file_name="openjdk-9.tar.gz"
openjdk_9_untar_dir_name="jdk-9.0.4"
curl ${openjdk_9_url} -o ${openjdk_9_file_name}
tar xvf ${openjdk_9_file_name}
mv ${openjdk_9_untar_dir_name}/ ${apps_path}/
rm -f $openjdk_9_file_name
JAVA_HOME="$apps_path/$openjdk_9_untar_dir_name"
sudo ln -s $JAVA_HOME/bin/java /usr/local/bin/java

# install nodejs npm

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# install appium

sudo npm install -g appium --allow-root --unsafe-perm

