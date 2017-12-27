
check-docker() {
  local DOCKER_PATH=$(which docker)
  if [ ! -x $DOCKER_PATH ]; then
    echo "[*] Cannot find docker on the PATH..."
    exit 1
  fi
}

image-exists() {
  sudo docker images | grep -q $1
  return $?
}

run-image() {
  local image_name=$1
  local docker_options=$2
  local command_options=$3

  check-docker
  
  if image-exists $image_name; then
    echo "[+] Running docker image: $image_name with options: $docker_options"
  else
    echo "[!] Image doesnt exist downloading first...."
    sudo docker pull $image_name
  fi

  sudo docker run $docker_options $image_name $command_options
}

stop-image() {
  local image_name=$1
  local container_id=$(sudo docker ps | grep $image_name | cut -d " "  -f1)

  if [[ $container_id != "" ]]; then
    echo "[+] Stopping $image_name..."
    sudo docker stop $container_id
    sudo docker rm $container_id
  else
    echo "[*] Container for $image_name not running..."
  fi

}
