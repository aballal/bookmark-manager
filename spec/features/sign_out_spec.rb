feature 'Signing out' do
  scenario 'A user can sign out' do
    user = User.create(email: 'harry@potter.com',
                       password: 'hogwarts',
                       password_confirmation: 'hogwarts')
    sign_in(email: 'harry@potter.com', password: 'hogwarts')
    expect(current_path).to eq '/links'
    click_button('Sign Out')
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content "Welcome, #{user.email}"
  end
end
