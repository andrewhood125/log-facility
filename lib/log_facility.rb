# frozen_string_literal: true

require_relative "log_facility/version"

module LogFacility
  LEVELS = [
    :EMERG,
    :ALERT,
    :CRIT,
    :ERR,
    :WARNING,
    :NOTICE,
    :INFO,
    :DEBUG
  ]

  SUPPRESS_MAX=20

  class Logger
    def initialize(path, mode = :append, levels = LEVELS)
      @logdev = File.open(path, 'w+')
      @logdev.sync = true

      case mode
      when :truncate
        @logdev.truncate(0)
      end

      # Define convenience methods for log levels
      levels.each do |level|
        define_singleton_method(level.downcase) do |*args|
          write(level, args)
        end
      end

      # Used to supress duplicate lines
      @last_line = ""
      @duplicate_count = 0
    end

    def write(*objects)
      msg = objects.join(' ') + "\n"
      return @duplicate_count += 1 if msg == @last_line && @duplicate_count < SUPPRESS_MAX

      if @duplicate_count > 0
        @logdev.write("#{Time.now.floor(3)} #{@last_line.chomp} suppressed #{@duplicate_count} times.\n")
      end

      @last_line = msg
      @duplicate_count = 0

      @logdev.write("#{Time.now.floor(3)} #{msg}")
    end
  end
end
