feature 'Signing in' do
  scenario 'A user can sign in with correct credentials' do
    user = User.create(email: 'harry@potter.com',
                       password: 'hogwarts',
                       password_confirmation: 'hogwarts')
    sign_in(email: 'harry@potter.com', password: 'hogwarts')
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, #{user.email}"
  end
end
