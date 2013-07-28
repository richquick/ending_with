# Require the following
require "fileutils"

class ReadWordList

  def initialize
  end

  def readlines filename
    buffer = File.readlines filename if File.exist? filename
  end

end

