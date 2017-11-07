# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = 'capistrano-nc'
  gem.version       = '0.1.4'
  gem.authors       = ['Kir Shatrov']
  gem.email         = ['shatrov@me.com']
  gem.summary       = "Capistrano 3 integration with Mountain Lion's Notification Center"
  gem.description   = 'https://github.com/capistrano/notification-center'
  gem.homepage      = 'https://github.com/capistrano/notification-center'

  gem.licenses      = %w(MIT)

  gem.add_dependency 'terminal-notifier', '~> 2.0'
  gem.add_dependency 'capistrano', '~> 3.0'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ['lib']
end
