require 'terminal-notifier'

module CapistranoNc
  def self.nc_supported?
    `uname`.strip == 'Darwin' && os_x_version >= Gem::Version.new('10.8')
  end

  def self.os_x_version
    Gem::Version.new(`sw_vers -productVersion`.strip)
  end
end

namespace :deploy do
  after :finished, 'nc:finished'
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

      TerminalNotifier.notify(announcement, title: "Capistrano")
    end
  end
end
