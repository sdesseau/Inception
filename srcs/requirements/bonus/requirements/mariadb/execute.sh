docker build -t mariadb . >/dev/null 2>&1
if [ $? -eq 0 ]; then
        echo "mariadb part is builded"
    else
        echo "ERROR:"
        echo "---"
        echo " "
        docker build -t mariadb .
        echo " "
        echo "---"
        echo "Solve this problem, mariadb is not builded"
        exit 1
    fi
      
echo "Launch with -it ? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    echo "Use 'exit' to stop container"
    docker run -it mariadb
else
    docker run mariadb
fi