def add_new_link(title, url, tags)
  visit '/links/new'
  fill_in 'title', with: title
  fill_in 'url', with: url
  fill_in 'tags', with: tags
  click_button 'Add Link'
end

def add_new_user(email, password)
  visit('/signup')
  fill_in 'email', with: email
  fill_in 'password', with: 'password'
  click_button 'Sign Up'
end
