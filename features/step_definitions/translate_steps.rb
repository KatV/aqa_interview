# Put your step definitions here
Given(/^I go to Google Translate site$/) do
  @browser = Watir::Browser.new 
  @browser.goto 'https://translate.google.com/?hl=en'
end

When(/^I fill in gap with "(.*?)"$/) do |arg1|
  @browser.textarea(:id => "source").set "#{arg1}"
  @browser.send_keys :return
    
end


Then(/^I should see "(.*?)"$/) do |arg1|
  page_output = @browser.span(:id => "result_box").text.include? "#{arg1}"
  assert (page_output==true)
  
  end

When(/^I enter (.*)$/) do |query|
	@browser.textarea(:id => 'source').set "#{query}"
    @browser.send_keys :return
end


When(/^I press the button$/) do
  @browser.input(:id => 'gt-submit').click
end

When(/^I choose "(.*?)"$/) do |arg1|
  language_button = @browser.div(:id => "gt-tl-gms").when_present.click
  menu = @browser.div(:id=> "gt-tl-gms-menu")
  @browser.div(:text => "#{arg1}").focus
  @browser.div(:text => "#{arg1}").click
end

When(/^I choose language (.*?)$/) do |language|
  language_button = @browser.div(:id => "gt-tl-gms").when_present.click
  menu = @browser.div(:id=> "gt-tl-gms-menu")
  @browser.div(:text => "#{language}").focus
  @browser.div(:text => "#{language}").click
end


Then(/^I see translation$/) do
  result_box = @browser.span(:id => "result_box")
  @browser.wait_until { result_box.text.length > 0 }
 
    puts result_box.text
    
end


  


