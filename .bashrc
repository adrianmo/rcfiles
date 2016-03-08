# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dpsq="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpsa="docker ps -a"

# Get images
alias dimg="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Remove all stopped containers
alias drme="docker ps -a |grep 'Exited' |awk '{print $1}' |xargs docker rm"

# Stop and Remove all containers
alias drmf="docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)"

# Remove all images
drmi() { docker rmi $(docker images -q); }

# Remove untagged images

drmiu() { docker rmi $(docker images |grep "<none>" |awk '{print $3}'); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }