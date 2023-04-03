require "./lcr/*"
module Lcr
  VERSION = "0.1.0"
  cmd_args = ""
  handler = Args.new
  handler.args_handler(cmd_args)
end
