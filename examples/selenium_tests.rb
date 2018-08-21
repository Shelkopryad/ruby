require 'rubygems'
require 'selenium-webdriver'

# использовать это, если хром ругается на сертификаты
# caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => ["test-type" ]})
# @browser = Selenium::WebDriver.for :chrome, :switches => %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]

@browser = Selenium::WebDriver.for :chrome

begin
  @browser.navigate.to "https://google.com/"
  p @browser.current_url

  @browser.manage.window.maximize
  @browser.find_element(xpath: "//div[@class=\"gb_Q gb_R\"][2]/a").click

  p @browser.title
  @browser.find_element(name: "q").send_keys "book"
  @browser.find_element(name: "btnG").click
  p @browser.find_elements(tag_name: "img").size
  @browser.close
rescue => e
  p e.message
end

# begin
#   @browser.get "https://vk.com/"
#   p @browser.title
#   @browser.find_element(id: "index_email").send_keys "email"
#   @browser.find_element(id: "index_pass").send_keys "password"
#   @browser.find_element(id: "index_login_button").click
#   p @browser.title
#   sleep 5
#   # wait = Selenium::WebDriver::Wait.new(:timeout => 20)
#   # wait.until { @browser.title.downcase.include? "новости" }
#   p @browser.title
#   @browser.find_element(xpath: "//*[@id=\"l_pr\"]/a").click
#   @browser.find_element(xpath: "//*[@id=\"submit_post_box\"]/div[4]").send_keys "Selenium"
# rescue => e
#   p e.message
# end
