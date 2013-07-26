# Require the following
require "fileutils"

class ReadWordList

  def initialize(filename)
    @filename = filename
  end

  def readlines(filename)
    buffer = File.readlines filename if File.exist? filename
  end

end

