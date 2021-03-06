#- XLsuite, an integrated CMS, CRM and ERP for medium businesses
#- Copyright 2005-2009 iXLd Media Inc.  See LICENSE for details.

class String
  def as_absolute_url(host, options={})
    return self if self.blank? || URI.parse(self).absolute?
    options[:protocol] = "http" if options[:protocol].blank?
    options[:ssl?] = false if options[:ssl?].blank?
    host_plus_self = host + "/" + self
    host_plus_self.gsub!(/(\/)+/, "/")
    %Q~#{options[:protocol]}#{options[:ssl?] ? 's' : nil}://#{host_plus_self}~
  end
  
  # Converts a post title to its-title-using-dashes
  # All special chars are stripped in the process  
  def to_url
    returning(self.downcase) do |result|
      # replace quotes by nothing
      result.gsub!(/['"]/, '')
  
      # strip all non word chars
      result.gsub!(/\W/, ' ')
  
      # replace all white space sections with a dash
      result.gsub!(/\ +/, '-')
  
      # trim dashes
      result.gsub!(/(-)$/, '')
      result.gsub!(/^(-)/, '')
    end
  end  
end
