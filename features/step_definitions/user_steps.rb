Given '{word} is an existing user' do |user|
  sign_up user
end

Given '{word} signs into the system' do |user|
  sign_in(@user)
end

Given '{word} is an user who has not signed up for an account' do |user|
  # @unknown_user = User.new
  # TODO: This shouldn't do anything really....
end

When '{word} visits the main page' do |user|
  visit '/'
end

When '{word} visits the create new account page' do |user|
  visit '/users/sign_up'
end

When '{word} submits valid email, password and password confirmation' do |user|
  within '#new_user' do
    fill_in 'user_email', with: 'new-test-user@testing.com'
    fill_in 'user_password', with: 'new-test-user-password-123'
    fill_in 'user_password_confirmation', with: 'new-test-user-password-123'
  end
  click_on 'Sign up'
end

Then '{word} should see the administration page' do |user|
  expect(page).to have_selector '#admin-page'
end

Then '{word} should NOT see the administration page' do |user|
  expect(page).not_to have_selector '#admin-page'
end

Then '{word} should see the home page' do |user|
  expect(page).not_to have_selector '#admin-page'
  expect(page).to have_content 'Sell your surf photography online'
end

def sign_in(user)
  visit '/users/sign_in'
  within '#new_user' do
    fill_in 'user_email', with: "coco@testing.com"
    fill_in 'user_password', with: "testing"
  end
  click_on 'Log in'
end

def sign_up user
  visit '/users/sign_up'
  within '#new_user' do
    fill_in 'user_email', with: "#{user}@imagehawk.app"
    fill_in 'user_password', with: "testing_password"
    fill_in 'user_password_confirmation', with: "testing_password"
  end
  click_on 'Sign up'
end
