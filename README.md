##tasks_table
* name (string)  
* detail (text)

##deploy方法

* heroku login herokuへログイン
* git add .　herokuへadd
* git commit -m "init" herokuへcommit
* heroku create 新リポジトリ作成　
* git push heroku master herokuへpush
* heroku run rails db:migrate heroku上へDB作成。
