require "spec_helper"

describe WriteDomainList do

  let(:results) {WriteDomainList.new}

  it "should create 'filename' and put 'text' in it" do
    output_file = mock('file')
    domains = "text"
    File.should_receive(:open).with(output_file, "w").and_yield(output_file)
    output_file.should_receive(:write).with(domains)
    results.write_file domains, output_file
  end

end