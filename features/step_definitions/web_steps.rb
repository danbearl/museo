Given /^that user is signed in.$/ do
  visit "/log_in"
  fill_in "email", with: @user.email
  fill_in "password", with: "pass"
  click_button "Sign In"
end

Given /^I am on the sign in page$/ do
  visit "/log_in"
end

Given /^I am on the home page$/ do
  visit "/"
end

Given /^I am on that post's page.$/ do
  visit "posts/#{@post.id}"
end

Given /^I am on the posts index.$/ do
  visit posts_path
end

Given /^I am on that page.$/ do
  visit @page.slug
end

Given /^I am on that image's page.$/ do
  visit image_path(@image.id)
end

Given /^I am on that gallery's page.$/ do
  visit gallery_path(@gallery.id)
end

Given /^I am on the galleries index page.$/ do
  visit galleries_path
end

When /^I follow "(.*?)"$/ do |link_name|
  click_link(link_name)
end

When /^I fill in the following:$/ do |table|
  table.raw.each do |r|
    fill_in r[0], :with => r[1]
  end
end

When /^I select the following:$/ do |table|
  table.raw.each do |r|
    select(r[1], from: r[0])
  end
end

When /^I press "(.*?)"$/ do |action|
  click_button action
end

Then /^I should see "(.*?)"$/ do |text|
  expect(page).to have_content(text)
end
