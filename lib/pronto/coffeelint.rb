require 'pronto'
require 'coffeelint'

module Pronto
  class Coffeelint < Runner
    def run
      return [] unless @patches

      @patches.select { |patch| patch.additions > 0 }
             .select { |patch| coffee_file?(patch.new_file_full_path) }
             .map { |patch| inspect(patch) }
             .flatten.compact
    end

    def inspect(patch)
      offences = ::Coffeelint.lint_file(patch.new_file_full_path).compact

      offences.map do |offence|
        patch.added_lines
          .select { |line| line.new_lineno == offence['lineNumber'] }
          .map { |line| new_message(offence, line) }
      end
    end

    def new_message(offence, line)
      path = line.patch.delta.new_file[:path]
      level = {
        'info' => :info,
        'warn' => :warning,
        'error' => :error,
        'fatal' => :fatal
      }[offence['level']]

      Message.new(path, line, level, offence['message'], nil, self.class)
    end

    def coffee_file?(path)
      File.extname(path) == '.coffee'
    end
  end
end
