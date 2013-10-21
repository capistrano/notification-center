# -*- encoding: utf-8 -*-
Gem::Specification.new do |gem|
  gem.name          = 'capistrano-nc'
  gem.version       = '0.1.0'
  gem.authors       = ['Kir Shatrov']
  gem.email         = ['shatrov@me.com']
  gem.description   = 'https://github.com/evrone/capistrano-nc'
  gem.summary       = "Capistrano 3 integration with Mountain Lion's Notification Center"
  gem.description   = 'https://github.com/evrone/capistrano-nc'

  gem.add_dependency 'terminal-notifier', '~> 1.4.2'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ['lib']
end
