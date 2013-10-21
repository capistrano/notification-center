# Capistrano + Notification Center

capistrano-nc integrates Capistrano and Mountain Lion's Notification Center.

![Screenshot](http://f.cl.ly/items/1k253H0o350m1F0L371j/Screen%20Shot%202012-09-29%20at%2012.57.34%20PM.png)

## Installation

### for Capistrano 3.x

```ruby
# Gemfile
gem 'capistrano-nc', '~> 0.1.0'
```

```ruby
# Capfile
require 'capistrano-nc/nc'
```

### for Capistrano 2.x

```ruby
# Gemfile
gem "capistrano-nc", "~> 0.0.2"
```

```ruby
# config/deploy.rb
require "capistrano-nc"
```

By default it will run the `nc:finished` task after your `deploy` or `deploy:migrations`. If this behavior doesn't suit you, you can hook `nc:finished` to any custom task by editing `deploy.rb`:

```
after `your:task`, `nc:finished`
```

## Contributors

- [Kir Shatrov](https://github.com/kirs/)

## Feel free to pull request!
