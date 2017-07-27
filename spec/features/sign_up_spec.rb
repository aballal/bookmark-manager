feature 'Sign up to Bookmark Manager' do
  scenario 'A new user can sign up with matching passwords' do
    email = 'alice@example.com'
    expect { add_new_user(email, 'oranges!', 'oranges!') }.to change(User, :count).by 1
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, #{email}"
    expect(User.last.email).to eq email
  end

  scenario 'A new user cannot sign up with non matching passwords' do
    email = 'alice@example.com'
    expect { add_new_user(email, 'oranges!', 'oranges') }.not_to change(User, :count)
    expect(current_path).to eq '/signup'
    expect(page).to have_content "Password and confirmation do not match"
  end

  scenario 'A new user cannot sign up with a blank email' do
    expect { add_new_user("", 'oranges!', 'oranges!') }.not_to change(User, :count)
  end

  scenario 'A new user cannot sign up with an invalid email' do
    expect { add_new_user("alice.com", 'oranges!', 'oranges!') }.not_to change(User, :count)
    expect { add_new_user("alice@example", 'oranges!', 'oranges!') }.not_to change(User, :count)
  end

end
