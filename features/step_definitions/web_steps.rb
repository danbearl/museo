Given /^that user is signed in.$/ do
  session[:user_id] = @user.id
end

Given /^I follow "(.*?)"$/ do |link_name|
  click_link(link_name)
end

When /^I fill in the following:$/ do |form|
  form.raw.each do |f|
    fill_in f[0], :with => [1]
  end
end

When /^I press "(.*?)"$/ do |action|
  click_button action
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end
