require 'capistrano'
require 'terminal-notifier'

module CapistranoNc
  module Capistrano
    def self.load_into(configuration)
      configuration.load do

        after 'deploy', 'nc:finished'
        after 'deploy:migrations', 'nc:finished'

        namespace :nc do
          task :finished do
            announced_stage = fetch(:stage, 'production')

            announcement = "\u2705 Successfully deployed "
            announcement += if fetch(:branch, nil)
              "#{application}'s #{branch} to #{announced_stage}"
            else
              "#{application} to #{announced_stage}"
            end

            TerminalNotifier.notify announcement, :title => "Capistrano"
          end
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  CapistranoNc::Capistrano.load_into(Capistrano::Configuration.instance)
end