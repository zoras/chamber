# frozen_string_literal: true

require 'chamber/commands/base'
require 'chamber/commands/heroku'

module  Chamber
module  Commands
module  Heroku
class   Clear < Chamber::Commands::Base
  include Chamber::Commands::Heroku

  def call
    chamber.to_environment.each_key do |key|
      next unless configuration.match(key)

      if dry_run
        shell.say_status 'remove', key, :blue
      else
        shell.say_status 'remove', key, :green
        shell.say heroku("config:unset #{key}")
      end
    end
  end
end
end
end
end
