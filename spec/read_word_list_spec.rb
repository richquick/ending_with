require "spec_helper"

describe ReadWordList do

  let(:results) {ReadWordList.new}

  context "read the lines of a file" do

    it "fails when there's no file" do
      # Safe to assume there's never going to be a file called 'no_such_file'
      results.readlines("no_such_file").should be_nil
    end
    
    it "succeeds when there is a file" do
      # Safe to assume there's going to be a file called 'spec_helper.rb'=
      results.readlines("spec/spec_helper.rb").should_not be_nil
    end

    it "creates an array" do
      results.readlines("spec/spec_helper.rb").should be_kind_of Array
    end

  end

end