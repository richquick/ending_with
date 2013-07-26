require "spec_helper"

describe CheckDomain do

  let(:results) {CheckDomain.new}
  let(:words) {["fellas","pizzas","redpandas"]}
  let(:tld) {"as"}

  context "A domain" do

    it "is false if it doesn't exist" do
      # Safe to assume there's never going to be a domain h.as registered as .as needs 3 letters
      results.domain_exists?("h.as").should be_false
    end

    it "is true if it does exist" do
      # Safe to assume w3.org is registered
      results.domain_exists?("w3.org").should be_true
    end

  end

  context "A list of words" do

    it "is an array" do
      results.check_words(words,tld).should be_kind_of Array
    end

    it "returns empty array when all domains are registered" do
      results.check_words(words,tld) == []
    end

    it "does not return and emptu array when some domains are not registered" do
      results.check_words(["has"],tld) != []
    end

    it "returns h.as when the word has is used" do
      results.check_words(["has"],tld) != ["h.as"]
    end

  end

end