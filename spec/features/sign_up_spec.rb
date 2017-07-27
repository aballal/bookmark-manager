feature 'Sign up to Bookmark Manager' do
  scenario 'A new user can sign up with matching passwords' do
    expect { add_new_user }.to change(User, :count).by 1
    expect(current_path).to eq '/links'
    expect(page).to have_content "Welcome, alice@example.com"
    expect(User.last.email).to eq 'alice@example.com'
  end

  scenario 'A new user cannot sign up with non matching passwords' do
    expect { add_new_user(password_confirmation: 'oranges') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'A new user cannot sign up with a blank email' do
    expect { add_new_user(email: "") }.not_to change(User, :count)
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'A new user cannot sign up with an invalid email' do
    expect { add_new_user(email: "alice.com") }.not_to change(User, :count)
    expect { add_new_user(email: "alice@example") }.not_to change(User, :count)
  end

  scenario 'A user cannot sign up with an existing email' do
    add_new_user
    expect { add_new_user }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

end
