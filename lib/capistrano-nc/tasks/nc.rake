require 'terminal-notifier'

module CapistranoNc
  def self.nc_supported?
    `uname`.strip == 'Darwin' && os_x_version >= Gem::Version.new('10.8')
  end

  def self.os_x_version
    Gem::Version.new(`sw_vers -productVersion`.strip)
  end
end

namespace :nc do
  task :finished do
    if CapistranoNc.nc_supported?
      announced_stage = fetch(:stage, 'production')
      application = fetch(:application)
      announcement = "\u2705 Successfully deployed "
      announcement += if fetch(:branch, nil)
        "#{application}'s #{fetch(:branch)} to #{announced_stage}"
      else
        "#{application} to #{announced_stage}"
      end

      terminal = fetch(:nc_terminal, 'com.apple.Terminal')
      timeout = fetch(:nc_terminal_timeout, '5')
      TerminalNotifier.notify(announcement, title: "Capistrano", sender: terminal, activate: terminal, timeout: timeout)
    end
  end
end

after 'deploy:finished', 'nc:finished'

namespace :load do
  task :defaults do
    set :nc_terminal_timeout, '5'
    set :nc_terminal, 'com.apple.Terminal'

  end
end
