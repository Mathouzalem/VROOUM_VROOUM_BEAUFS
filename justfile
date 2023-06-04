hello:
  echo "hello just alex"

  git checkout master

  git pull origin master

  git push heroku master

  heroku run rails db:migrate

  heroku run rails db:seed

  heroku open

commit:
  git co testjust
  git status
  git add .
  git commit -m "add just"
  git push origin testjust
