echo "[Set ARG]"
echo set debconf to Noninteractive
echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections

echo "[apt-get update]"
sudo apt-get update

echo "[apt install software-properties-common]"
sudo apt install -y software-properties-common

echo "[Install ca-certificates curl gnupg]"
sudo apt-get install -y ca-certificates curl gnupg

echo "[Install docker gpg key]"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "[Add apt package list]"
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[sudo apt-get update]"
sudo apt-get update

echo "[Install docker-ce]"
VERSION_STRING=5:23.0.4-1~ubuntu.20.04~focal
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin