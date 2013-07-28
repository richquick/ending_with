load "lib/read_word_list.rb"
load "lib/check_domain.rb"
load "lib/write_domain_list.rb"

require "optparse"
require "timeout"

default_input  = "files/words.txt"
default_output = "files/domains.txt"
default_tld    = "as"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ew.rb [options]"

  
  opts.on('-i', '--input NAME' , 'Input File' )                         { |v| options[:input] = v }
  opts.on('-o', '--output NAME', 'Output File')                         { |v| options[:output] = v }
  opts.on('-t', '--tld NAME'   , 'TLD'        )                         { |v| options[:tld] = v }
  
  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
  end

end.parse!

options[:input]  = default_input  unless options[:input]
options[:output] = default_output unless options[:ouput]
options[:tld]    = default_tld    unless options[:tld]

word_file = ReadWordList.new
word_list = word_file.readlines options[:input]

domain_object = CheckDomain.new
domain_list   = domain_object.check_domains word_list, options[:tld]