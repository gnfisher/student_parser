$:.unshift "#{File.dirname(__FILE__)}/lib"
require "student_viewer_cli"

StudentViewerCLI.new(input: "./data").run
