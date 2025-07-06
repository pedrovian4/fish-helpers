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
    echo "Docker shortcuts:"
    echo " dps  - list running containers"
    echo " dpa  - list all containers"
    echo " dim  - list images"
    echo " dbu  - build image: dbu <tag> [context]"
    echo " dr   - run container interactively (rm after)"
    echo " de   - exec shell into container: de <container>"
    echo " ds   - stop container"
    echo " drm  - remove container"
    echo " dri  - remove image"
    echo " dl   - show logs"
    echo " dlf  - show logs (follow)"
    echo " dba  - build app image (app:latest): dba <path>"
    echo " dcp  - remove stopped containers"
    echo " dpi  - remove unused images"
    echo " ddf  - docker disk usage"
    echo " dcl  - clean docker system (containers, images, volumes)"
end
