describe User do
  let!(:user) { User.create(email: 'unit@test.com',
          password: 'so_tired', password_confirmation: 'so_tired') }

  it 'authenticates when given a valid user id and password' do
    authenticated_user = User.authenticate('unit@test.com', 'so_tired')
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an invalid password' do
    authenticated_user = User.authenticate('unit@test.com', 'full_of_energy')
    expect(authenticated_user).to be_nil
  end

end
