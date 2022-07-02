When '{word} creates a session with assets' do |photographer_name|
  sign_up photographer_name
  visit '/'
  click_on 'Create new session'
  fill_in 'session_title', with: "#{photographer_name} test session"
  fill_in 'session_description', with: "This is a test description #{photographer_name}"
  # fill_in 'session_default_price', with: "23.23"
  # click_on 'Save'
  # pending
end

When '{word} visits the session page' do |user_name|
  # pending
end

Then '{word} should be able to make a purchase' do |user_name|
  # pending
end