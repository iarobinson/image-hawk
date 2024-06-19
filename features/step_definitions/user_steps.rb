Given '{word} signs up as a user' do |user|
  create_visitor
  sign_up @visitor
end

Given '{word} signs into the system' do |user|
  sign_in(@user)
end

Given '{word} is an user who has not signed up for an account' do |user|
  # @unknown_user = User.new
  # TODO: This shouldn't do anything really....
end

When '{word} submits valid sign up email, password and password confirmation' do |user|
  within '#new_user' do
    fill_in 'user_email', with: 'new-test-user@testing.com'
    fill_in 'user_password', with: 'testUser123'
    fill_in 'user_password_confirmation', with: 'testUser123'
  end
  click_on 'Sign up'
end

Then '{word} should see the administration page' do |user|
  expect(page).to have_selector('#admin-page')
end

Then '{word} should NOT see the administration page' do |user|
  expect(page).not_to have_selector('#admin-page')
end

Then '{word} should see the home page' do |user|
  expect(page).not_to have_selector '#admin-page'
  expect(page).to have_content 'Sell your surf photography online'
end

When '{string} visits the {string} page'  do |user, destination|
  if destination == "sign up"
    visit new_user_registration_path
  elsif destination == "index"
    visit root_path
  else
    raise "The destination needs to be filled out in user_steps.rb"
  end
end

Then '{word} should be redirected to the main index page'  do |user|
  expect(page.current_url).to eq(root_url)
end

def sign_in user
  visit '/users/sign_in'
  if user == "invalid credentials"
    within '#new_user' do
      fill_in 'user_email', with: "invalid@testing.com"
      fill_in 'user_password', with: "testing"
    end
  elsif user.present?
    within '#new_user' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
    end
  end
  click_on 'Log in'
end

def sign_up user
  visit '/users/sign_up'
  within '#new_user' do
    fill_in 'user_email', with: user[:email]
    fill_in 'user_password', with: user[:password]
    fill_in 'user_password_confirmation', with: user[:password_confirmation]
  end
  click_on 'Sign up'
end
def create_visitor
  @visitor ||= {
    name: "Manny Testerman",
    email: "manny@testerman.com",
    password: "awesome",
    password_confirmation: "awesome"
  }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  sign_out
end

def create_user username
  @user = User.create({
    email: "#{username}@testing.com",
    password: "testing",
    password_confirmation:
    "testing"
  })
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_out username
  visit "/"
  click_link "Sign out" if page.text.match?("Sign out")
end

### GIVEN ###
Given "{word} is not logged in" do |username|
  sign_out username
end

Given "{word} is logged in" do |username|
  create_user username
  sign_in @user
end

Given "{word} exists as a user" do |username|
  create_user username
end

Given "{word} do not exist as a user" do |user_handle|
  visit root_path
  click_on "Sign out" if page.text.include?("Sign out")
end

Given "I exist as an unconfirmed user" do
  create_unconfirmed_user
end

### WHEN ###
When "{word} signs in with {word} credentials" do |username, valid_or_invalid|
  if valid_or_invalid == 'valid'
    sign_in @user
  elsif valid_or_invalid == 'invalid'
    sign_in "invalid credentials"
  else
    raise StandardError.new "You must either 'valid' or 'invalid"
  end
end

When "{word} signs out" do |username|
  visit root_path
  click_on 'Sign Out'
end

When "{word} signs up with valid user data" do |username|
  create_visitor
  sign_up @visitor
end

When "{word} signs up with an invalid email" do |username|
  create_visitor
  @visitor[:email] = "notanemail"
  sign_up @visitor
end

When "{word} sign up without a password confirmation" do |username|
  create_visitor
  @visitor[:password_confirmation] = ""
  sign_up @visitor
end

When "{word} signs up without a password" do |username|
  create_visitor
  @visitor[:password] = ""
  sign_up @visitor
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up @visitor
end

When "{word} returns to the site" do |username|
  visit '/'
end

When "{word} signs in with an incorrect email" do |username|
  sign_in 'invalid credentials'
end

When "{word} signs in with an incorrect password" do |username|
  sign_in 'invalid credentials'
end

When "{word} saves the edit form" do |username|
  click_button "Save"
end

When "{word} edits their account name" do |username|
  visit root_path
  @user[:name] = "neat_new_nombre"
  fill_in "user_name", with: @user[:name]
end

When "{word} edits their email address" do |username|
  fill_in "user_email", :with => "newemail@example.com"
end

When "{word} doesn't enter their current password" do |username|
  fill_in "user_current_password", :with => ""
end

When "{word} edits their email address with an invalid email" do |username|
  visit root_path
  fill_in "user_email", with: "notanemail"
end

When "{word} edits their password" do |username|
  fill_in "user_password", :with => "newpassword"
  fill_in "user_password_confirmation", :with => "newpassword"
  fill_in "user_current_password", :with => @visitor[:password]
end

When "{word} edits their password with missing confirmation" do |username|
  fill_in "user_password", :with => "newpassword"
  fill_in "user_current_password", :with => @visitor[:password]
end

When "{word} edits their password with missmatched confirmation" do
  click_link "Edit account"
  fill_in "user_password", :with => "newpassword"
  fill_in "user_password_confirmation", :with => "newpassword123"
  fill_in "user_current_password", :with => @visitor[:password]
end

When "{word} look at the list of users" do |username|
  visit '/users'
end

### THEN ###
Then "{word} should be signed in" do |username|
  page.should have_selector "#admin-page"
end

Then "{word} should be signed out" do |username|
  visit root_path
  page.should_not have_selector "#admin-page"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then "{word} should see a successful sign {word} message" do |username, in_or_up|
  if in_or_up == 'in'
    page.should have_content "Signed in successfully."
  elsif in_or_up == 'up'
    page.should have_content "Welcome! You have signed up successfully."
  end
end

Then "{word} should see an invalid email message" do |username|
  page.should have_content "Email is invalid"
end

Then "{word} should see a missing password message" do |username|
  page.should have_content "Password can't be blank"
end

Then "{word} should see a missing password confirmation message" do |username|
  page.should have_content "Password confirmation doesn't match"
end

Then "{word} should see a mismatched password message" do |username|
  page.should have_content "Password confirmation doesn't match"
end

Then "{word} should see a signed out message" do |username|
  page.should have_content "Signed out successfully."
end

Then "{word} should see an invalid login message" do |username|
  page.should have_content("Invalid Email or password.")
end

Then "{word} should see an account edited message" do |username|
  page.should have_content "User was successfully updated."
end

Then "{word} should see a current password missing message" do |username|
  page.should have_content "Current password can't be blank"
end

Then "{word} should see their name" do |username|
  page.should have_content @user[:name]
end

