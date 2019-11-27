# prepare
fd_env="rails_env"
fdpath_app="/app"
if [ ! -e ../$fd_env ]; then
  mkdir ../$fd_env
fi
cd ./file

# build & boot container
docker-compose build --no-cache
docker-compose up  -d

# init rails application
\cp -f ./Gemfile ../../$fd_env/Gemfile
\cp -f ./Gemfile.lock ../../$fd_env/Gemfile.lock
docker-compose exec app cd $fdpath_app
docker-compose exec app rails new . -d mysql -s
# Create database
\cp -f ./database.yml ../../$fd_env/config/database.yml
docker-compose exec app rails db:create
# Use slim
docker-compose exec app bundle exec erb2slim $fdpath_app/app/views/layouts/ --delete
# Use bootstrap
rm ../../$fd_env/app/assets/stylesheets/application.css
touch ../../$fd_env/app/assets/stylesheets/application.scss
echo '@import "bootstrap";' > ../../$fd_env/app/assets/stylesheets/application.scss
#docker-compose exec app rm $fdpath_app/app/assets/stylesheets/application.css
#docker-compose exec app touch $fdpath_app/app/assets/stylesheets/application.scss
#docker-compose exec app "echo '@import \"bootstrap\";' > ${fdpath_app}/app/assets/stylesheets/application.scss"
# Set Japanese
docker-compose exec app wget https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml --output-file=$fdpath_app/config/locales/ja.yml
touch ../../$fd_env/config/initializers/locale.rb
echo 'Rails.application.config.i18n.default_locale = :ja' > ../../$fd_env/config/initializers/locale.rb
#docker-compose exec app touch $fdpath_app/config/initializers/locale.rb
#docker-compose exec app "echo 'Rails.application.config.i18n.default_locale = :ja' > ${fdpath_app}/config/initializers/locale.rb"

# after operation
cd ../
