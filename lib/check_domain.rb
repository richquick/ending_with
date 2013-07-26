class CheckDomain

  def initialize
  end

  def domain_exists? domain
    true unless `nslookup #{domain}`.include? "NXDOMAIN"
  end

  def check_words words, tld
    domains = []
    words.each do |word|
      domain = word.gsub(/#{tld}$/,".#{tld}")
      if domain_exists? domain
        domains << domain
      end
    end
    domains
  end
end