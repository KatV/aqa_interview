# Put your step definitions here
require 'watir-webdriver'
require 'cucumber'

Given(/^I go to Google Translate site$/) do
  @browser = Watir::Browser.new :ff
  @browser.goto 'https://translate.google.ru/'
end

When(/^I fill in gap with "(.*?)"$/) do |arg1|
  @browser.textarea(:id => "source").set "#{arg1}"
  @browser.send_keys :return
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page_output = @browser.span(:id => "result_box").text.include? "#{arg1}"
  assert (page_output==true)
  @browser.close
  end

When(/^I enter (.*)$/) do |query|
  @browser.textarea(:id => "source").set "#{query}"
  @browser.send_keys :return
end

When(/^I choose Russian language$/) do
  @browser.div(:class => 'goog-inline-block jfk-button jfk-button-standard jfk-button-collapse-right jfk-button-checked').click
end

Then(/^I should see a translation of (.*)$/) do |query1|
  
  page_output = @browser.span(:id => "result_box").text.include? "#{query1}"
  assert (page_output==true)
  @browser.close
end


When(/^I choose English language$/) do
  @browser.div(:class => 'goog-inline-block jfk-button jfk-button-standard jfk-button-collapse-left jfk-button-collapse-right').click
end

When(/^I press the button$/) do
  @browser.input(:id => 'gt-submit').click
end


