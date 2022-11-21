docker build -t wordpress . >/dev/null 2>&1
if [ $? -eq 0 ]; then
        echo "wordpress part is builded"
    else
        echo "ERROR:"
        echo "---"
        echo " "
        docker build -t wordpress .
        echo " "
        echo "---"
        echo "Solve this problem, wordpress is not builded"
        exit 1
    fi
      
echo "Launch with -it ? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    echo "Use 'exit' to stop container"
    docker run -it wordpress
else
    docker run wordpress
fi