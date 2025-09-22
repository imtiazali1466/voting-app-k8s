
#!/bin/bash

clear 

echo "####################################################"
echo "Updating the system packages and Dependencies..."
echo "####################################################"

sudo apt-get update

echo "Unistalling Docker..."
# Uninstall old versions
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

echo "####################################################"
echo "Installing Docker..."
echo "####################################################"
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "####################################################"
echo "Installing Docker, containerd and compose..."
echo "####################################################"
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

echo "####################################################"
echo "Installing Docker Engine, containerd, and Docker Compose..."
echo "####################################################"
# Install Docker Engine, containerd, and Docker Compose.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add your user to the docker group:
sudo usermod -aG docker $USER


# Verify that version and enable docker services.
docker --version
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "####################################################"
echo "Starting Docker and running hello-world image..."
echo "####################################################"
# Start Docker and check status
sudo systemctl start docker
sudo nohup systemctl status docker > docker_status.log 2>&1 &
sleep 3
cat docker_status.log   

# run hello-world image in the background
sudo su -l $USER -c "docker run hello-world"
sleep 2
docker ps -a
docker system prune -f -y # clean up 