sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates

# git
sudo apt-get install -y git

# nodejs
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install -y docker-engine
sudo service docker start

# dotnet
echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet/ xenial main" | sudo tee /etc/apt/sources.list.d/dotnetdev.list
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.0-preview2-003131

# vscode
wget https://go.microsoft.com/fwlink/?LinkID=760868 -qO vscode.deb
sudo dpkg -i vscode.deb
rm vscode.deb
code --version
code --install-extension ms-vscode.csharp
code --install-extension cake-build.cake-vscode
code --install-extension dbaeumer.vscode-eslint
