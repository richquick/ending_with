class CheckDomain

  def initialize
  end

  def domain_exists? domain
    return false unless domain.include? "."
    true unless `nslookup #{domain}`.include? "NXDOMAIN"
  end

  def check_domains words, tld
    domains = []
    words.each do |word|
      domain = word.gsub(/#{tld}$/,".#{tld}")
      if domain_exists? domain
        print "+"
        domains << domain
      else
        print "-"
      end
    end
    domains
  end
end