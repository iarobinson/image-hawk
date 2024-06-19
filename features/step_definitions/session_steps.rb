Given '{word} creates a new session with photos' do |username|
  visit new_session_path
  within '#new_session' do
    fill_in 'session_title', with: 'The title of this test session'
    fill_in 'session_description', with: 'some test description'
    fill_in 'session_default_price', with: '2.22'
    attach_file("session_images", Rails.root + "test/fixtures/images/surf-photo-1.jpeg")
  end
  click_on "Save"
  @session = Session.last
end

When '{word} visits that session page' do |username|
  visit session_path @session
end

Then '{word} should see the photos' do |username|
  expect(@session.id.to_s).to eq(page.current_url.split('/')[-1])
  # page.html.should have_content 'charges/new'
end

When('{word} clicks on the image intending to buy') do |username|
  pending # Write code here that turns the phrase above into concrete actions
end

When('{string} clicks the {string} button') do |username, button_text|
  page.click_link(button_text)
end

Then('{string} should be redirected to the {string}') do |username, destination_path|
  if destination_path == "sign up page"
    expect(page.current_path == "/users/sign_up")
  else
    pending
  end
end

Then('{word} should be redirected to the stripe payment gateway') do |username|
  pending # Write code here that turns the phrase above into concrete actions
end

