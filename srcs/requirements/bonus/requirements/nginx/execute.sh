# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    execute.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: stan <stan@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/19 17:06:50 by stan              #+#    #+#              #
#    Updated: 2022/11/19 17:06:52 by stan             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

docker build -t nginx . >/dev/null 2>&1
if [ $? -eq 0 ]; then
        echo "nginx part is builded"
    else
        echo "ERROR:"
        echo "---"
        echo " "
        docker build -t nginx .
        echo " "
        echo "---"
        echo "Solve this problem, nginx is not builded"
        exit 1
    fi
      
echo "Launch with -it ? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    echo "Use 'exit' to stop container"
    docker run -it nginx
else
    docker run nginx
fi