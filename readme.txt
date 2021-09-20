Делал backend, фронтом особо не заморачивался.

Логин/пароль к сайту:
user: admin
pass: 012346789

Сделал два репозитория: один для продакшана, второй для лок разработки.
ssl не стал настраивать, для тестового он не нужен.
SECRET_KEY, логины, пароли выложил на git (знаю, что так не делают) для быстроты разворачивания.

Инструкция по разворачиванию в продакшн:
# Установить докер
sudo apt install docker-ce
# Установить docker-compose
sudo pip3 install docker-compose
# Запустить демон Docker и активировать его автозапуск:
sudo systemctl start docker
sudo systemctl enable docker

docker-compose -f docker-compose.yml up -d --build
# если надо, затереть старую базу: (потом перезапустить docker-compose или сделать миграцию)
docker-compose exec web python manage.py flush --no-input 
#Если с первого раза не заработал, перезапустить.



Инструкция по разворачиванию в деплой:
аналогична приведённой для продакшана, только другой дистрибутив:
git clone https://github.com/Al-exanderr/employeess_dev.git

Буду очень благодарен за фидбек..
