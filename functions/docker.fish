function dsa
    set c (docker ps -q)
    if test -z "$c"
        echo "No running containers to stop."
        return
    end
    docker stop $c
end

alias dps='docker ps'

alias dpa='docker ps -a'

alias dim='docker images'

function dbu
    if test (count $argv) -eq 0
        echo "Usage: dbu <tag> [context]"
        return 1
    end
    set ctx (count $argv) -gt 1; and echo $argv[2]; or echo '.'
    docker build --progress=plain --no-cache=false -t $argv[1] $ctx
end

alias dr='docker run -it --rm'

function de
    if test (count $argv) -eq 0
        echo "Usage: de <container>"
        return 1
    end
    docker exec -it $argv[1] sh
end

alias ds='docker stop'

alias drm='docker rm'

alias dri='docker rmi'

function dl
    if test (count $argv) -eq 0
        echo "Usage: dl <container>"
        return 1
    end
    docker logs $argv[1]
end

function dlf
    if test (count $argv) -eq 0
        echo "Usage: dlf <container>"
        return 1
    end
    docker logs -f $argv[1]
end

function dba
    if test (count $argv) -eq 0
        echo "Usage: dba <path>"
        return 1
    end
    docker build -t app:latest $argv[1]
end

alias dcp='docker container prune -f'

alias dpi='docker image prune -a -f'

alias ddf='docker system df'

alias dcl='docker system prune -af --volumes'

function dh
    set_color normal
    echo -e "\033[1;34m🐳 Docker shortcuts:\033[0m"

    echo -e "\033[1;33m dps  \033[0m - 🟢 list running containers"
    echo -e "\033[1;33m dpa  \033[0m - 📋 list all containers"
    echo -e "\033[1;33m dim  \033[0m - 🖼️ list images"
    echo -e "\033[1;33m dbu  \033[0m - 🏗️ build image: dbu <tag> [context]"
    echo -e "\033[1;33m dr   \033[0m - ▶️ run container interactively (rm after)"
    echo -e "\033[1;33m de   \033[0m - 🐚 exec shell into container: de <container>"
    echo -e "\033[1;33m ds   \033[0m - ✋ stop container"
    echo -e "\033[1;33m drm  \033[0m - 🗑️ remove container"
    echo -e "\033[1;33m dri  \033[0m - 🖼️ remove image"
    echo -e "\033[1;33m dl   \033[0m - 📜 show logs"
    echo -e "\033[1;33m dlf  \033[0m - 📜📡 show logs (follow)"
    echo -e "\033[1;33m dba  \033[0m - 🏷️ build app image (app:latest): dba <path>"
    echo -e "\033[1;33m dcp  \033[0m - 🚮 remove stopped containers"
    echo -e "\033[1;33m dpi  \033[0m - 🧹 remove unused images"
    echo -e "\033[1;33m ddf  \033[0m - 💾 docker disk usage"
    echo -e "\033[1;33m dcl  \033[0m - 🧽 clean docker system (containers, images, volumes)"
end
