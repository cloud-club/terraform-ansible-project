# 기본 의존성 패키지 설치
apt-get update
apt-get install -y python3 openjdk-11-jre awscli

# 테라폼 설치
wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# 패커 설치
cd /usr/local/bin
wget -q https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_linux_amd64.zip
unzip packer_1.8.6_linux_amd64.zip

# clean
apt-get clean
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
rm packer_1.8.6_linux_amd64.zip