feature 'Sign up to Bookmark Manager' do
  scenario 'A new user can sign up' do
    email = 'alice@example.com'
    expect { add_new_user(email, 'oranges!') }.to change(User, :count).by 1
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, #{email}"
    expect(User.last.email).to eq email
  end
end
