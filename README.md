# Capistrano + Notification Center

capistrano-nc integrates Capistrano and OS X Notification Center.

![Screenshot](http://f.cl.ly/items/1k253H0o350m1F0L371j/Screen%20Shot%202012-09-29%20at%2012.57.34%20PM.png)

## Installation

### for Capistrano 3.x

```ruby
# Gemfile
gem 'capistrano-nc', '~> 0.2'
```

```ruby
# Capfile
require 'capistrano-nc/nc'
```

### for Capistrano 2.x

```ruby
# Gemfile
gem "capistrano-nc", "0.0.2"
```

```ruby
# config/deploy.rb
require "capistrano-nc"
```

By default it will run the `nc:finished` task after your `deploy` or `deploy:migrations`. If this behavior doesn't suit you, you can hook `nc:finished` to any custom task by editing `deploy.rb`:

```
after `your:task`, `nc:finished`
```

Terminal.app is opened when the notification is clicked. To use an alternative terminal set `:nc_terminal` to the bundle identifier e.g. `set :nc_terminal, 'com.googlecode.iterm2'` for iTerm2.

The default terminal timeout is set to 5 seconds. To Change it `set :nc_terminal_timeout '10'` for other number in seconds.

## Contributors

- [Kir Shatrov](https://github.com/kirs/)

## Feel free to pull request!
