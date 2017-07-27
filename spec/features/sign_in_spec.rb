require_relative 'web_helper'

feature 'Signing in' do
  scenario 'A user can sign in with correct credentials' do
    user = User.create(email: 'peter@rabbit.com', password: 'lettuce', password_confirmation: 'lettuce')
    sign_in(email: 'peter@rabbit.com', password: 'lettuce')
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, #{user.email}"
  end

  # Add a test for incorrect credentials
end
