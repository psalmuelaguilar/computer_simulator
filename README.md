# TenTen Programming Assignment Computer Simulator
## Getting Started
This Coding challenge is a simple IRB on web. as the requirements should support executing

```
  def print_tenten
    print(multiply(101, 10))
  end

  print(1009)
  print_tenten()

  # 1099
  # 1010
```

### Prerequisites
* Ruby version: ruby 2.4.2p198
* Database: Postgres 9.1+ (should support array)
* RVM or RBENV or similar

### Installation

* Install Gem (on terminal)
```
gem install bundler
bundle install
```

* Setting up the database and seed file (on terminal)
```
rake db:create db:migrate db:seed
```

* Starting the Project (on terminal) go to localhost:3000/codes
```
rails s
```

* Running the specs (on terminal)
```
rspec .
```

### Information on how to use

* After Starting the Project go to `localhost:3000/codes`
* Type the code at the bottom text area, then press submit
