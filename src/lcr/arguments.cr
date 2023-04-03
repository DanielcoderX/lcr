module Lcr
  class Args
    def args_handler(cmd : String)
      directory_regex = /^(.\/)?([^\/]*)$/
      if ARGV.size <= 0
        puts "Need at least one argument"
        puts "Use --help"
        exit 0
      else
        cmd = ARGV[0]
      end
      if cmd.includes?("--help")
        puts "Usage:"
        puts "  lccgo ./file.txt"
        puts "  lccgo src/"
        exit 0
      end
      if directory_regex.match(cmd) == nil
        if File.exists?(cmd)
          Counter.character_and_line_counter(cmd)
          exit 1
        else
          exit 0
        end
      end
    end
  end
end
