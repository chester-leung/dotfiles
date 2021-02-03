echo 'deb [arch=amd64] https://download.01.org/intel-sgx/sgx_repo/ubuntu bionic main' | sudo tee /etc/apt/sources.list.d/intel-sgx.list
wget -qO - https://download.01.org/intel-sgx/sgx_repo/ubuntu/intel-sgx-deb.key | sudo apt-key add -

echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main" | sudo tee /etc/apt/sources.list.d/llvm-toolchain-bionic-7.list
wget -qO - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/18.04/prod bionic main" | sudo tee /etc/apt/sources.list.d/msprod.list
wget -qO - https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo apt update

sudo apt -y install clang-8 libssl-dev gdb libsgx-enclave-common libprotobuf10 libsgx-dcap-ql libsgx-dcap-ql-dev az-dcap-client open-enclave=0.12.0

source /opt/openenclave/share/openenclave/openenclaverc

echo "source /opt/openenclave/share/openenclave/openenclaverc" >> ~/.bashrc

mkdir downloads
cd downloads
wget https://github.com/Kitware/CMake/releases/download/v3.15.6/cmake-3.15.6-Linux-x86_64.sh
sudo bash cmake-3.15.6-Linux-x86_64.sh --skip-license --prefix=/usr/local

cd ..
sudo apt-get install -y libmbedtls-dev python3-pip
pip3 install numpy pandas sklearn numproto grpcio grpcio-tools


