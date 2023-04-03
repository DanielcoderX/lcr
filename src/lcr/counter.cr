module Lcr
  class Counter
    def self.character_and_line_counter(cmd : String)
      counts = 0
      lines = 0
      is_printed = false

      file = File.open(cmd)
      fileInfo = nil

      begin
        fileInfo = file.info
      rescue err : Exception
        puts err
      end

      if fileInfo && fileInfo.directory?
        files = Dir.children(cmd)
        cmd += "/" unless cmd.ends_with?("/")
        files.each do |v|
          if File.directory?(cmd + v)
            puts "Directory: #{cmd + v}"
            character_and_line_counter(cmd + v)
          else
            character_and_line_counter(cmd + v)
          end
        end
      else
        puts "File: #{cmd}"
        is_printed = true
        file.each_line do |line|
          lines += 1
          counts += line.bytesize
        end
      end
      if is_printed
        puts "Lines: #{lines}"
        puts "Characters: #{counts}"
      end
    ensure
      file.close unless file.nil?
    end
  end
end
