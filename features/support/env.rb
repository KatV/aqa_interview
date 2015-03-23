require "watir-webdriver"

Before do
	@browser = Watir::Browser.new :ff  #открыть баузер
end

After do
	@browser.close #закрыть браузер
end
