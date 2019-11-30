# prepare
cd file

# boot container
boot_container_count=$(docker-compose ps | grep Up | grep -c file)
if [ $boot_container_count =  0 ]; then
  docker-compose up -d
fi

# login container
docker-compose exec app /bin/bash

# after operation
cd ../
