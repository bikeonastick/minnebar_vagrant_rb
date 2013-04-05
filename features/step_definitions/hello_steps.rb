require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

When /^I visit "(.*?)" with parameter "(.*?)"$/ do |page_name,parameter|
  if(parameter == '1')
    @retval = 'robert'
  else
    @retval = 'jeff'
  end
  #stub_request(:get, "http://10.1.10.10:8080/minnebar/store/#{parameter}").
  stub_request(:get, "http://10.0.10.30:8080/minnebar/store/#{parameter}").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => @retval, :headers => {})
  visit "/#{page_name}/#{parameter}"
end

When /^I navigate to "(.*?)"$/ do |page_name|
  visit "/#{page_name}/"
end
