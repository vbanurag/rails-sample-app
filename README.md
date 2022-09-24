## Required Installations:
1. [Ruby](https://www.ruby-lang.org/en/downloads/)
	
2. Ruby on Rails Framwork. v2.6.2
From terminal/cmd:
```
gem install rails
```
3. Postgres



## Project Configurations:
1. Clone 'rrails-sample-app' project to 'your destination'
```
cd 'your destination'
git clone https://github.com/vbanurag/rails-sample-app.git
```

2. Install bundle
```
cd 'rails-crud'
bundle install
```
3. Change username/password in 'rails-crud/config/database.yml' to match your psql database username/password:
```ruby
username: 'your username'
password: 'your password'
```

4. Run migrations for the project to build its tables:
```
rails db:migrate
```

5. Run Server:
```
rails server
```

7. Open your browser, navigate to:
* 'localhost:3000/products' for public products
* 'localhost:3000/auth/login' for login
* 'localhost:3000/users/signup' for user signup
* 'localhost:3000/users' for user 



