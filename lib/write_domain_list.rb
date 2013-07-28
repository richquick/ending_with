class WriteDomainList

  def initialize
  end

  def write_file domains, output_file
    File.open output_file, "w" do |file|
      file.write(domains)
    end
  end

end