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
echo -e '//= require jquery3 \n//= require popper \n//= require bootstrap-sprockets' >> ../../$fd_env/app/assets/javascripts/application.js
# Set Japanese
docker-compose exec app "wget https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml"
mv ../../$fd_env/ja.yml  ../../$fd_env/config/locales/ja.yml -f
touch ../../$fd_env/config/initializers/locale.rb
echo 'Rails.application.config.i18n.default_locale = :ja' > ../../$fd_env/config/initializers/locale.rb
# after operation
cd ../
