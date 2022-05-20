Given '{word} is a user who has signed up for an ImageHawk account' do |user|
  @user = User.new({
    "email": "test_photographer_user@testing.com",
    "password": "photographerpassword",
    "slug": "photographer-test-user",
    "name": "Test"
  })
end

Given '{word} signs into the system' do |user|
  sign_in(@user)
end

Given '{word} is an user who has not signed up for an account' do |user|
  @unknown_user = User.new
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
  assert page.has_field?('admin-page')
end

Then '{word} should see the home page' do |user|
  assert page.has_content?("ImageHawk")
  assert page.has_no_field?("admin-page")
end

def sign_in(user)
  # Somehow we need to add aunthenticity_token to the test user
  p "Sign In"
end
