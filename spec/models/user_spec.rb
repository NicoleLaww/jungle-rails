require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 
    it 'should be a valid user when a first/last name, unique email and the same password/password confirmation inputted' do 
      user = User.new(
        first_name: 'Chippy', 
        last_name: 'Munk',
        email: 'acorns@gmail.com', 
        password: 'NUTSS!',
        password_confirmation: 'NUTSS!'
      )

      expect(user).to be_valid
    end 

    it 'should not be a valid user when the passwords do not match' do 
      user = User.new(
        first_name: 'Trash', 
        last_name: 'Panda',
        email: 'recyclingsucks@gmail.com', 
        password: 'Sad',
        password_confirmation: 'Bad'
      )

      expect(user).to_not be_valid
    end 

    it 'should not be a valid user when the password confirmation is left blank' do 
      user = User.new(
        first_name: 'Trash', 
        last_name: 'Panda',
        email: 'recyclingsucks@gmail.com', 
        password: 'Sad',
        password_confirmation: nil
      )

      expect(user).to_not be_valid
    end 

    it 'should not be a valid user when there is no password' do 
      user = User.new(
        first_name: 'Trash', 
        last_name: 'Panda',
        email: 'recyclingsucks@gmail.com', 
        password: nil,
        password_confirmation: nil
      )

      expect(user).to_not be_valid
    end 

  it 'should not be a valid user when same user creates an account with same email' do 
      user1 = User.new(
        first_name: 'Traz', 
        last_name: 'Pandaz',
        email: 'recyclingsucks@gmail.com', 
        password: 'Trashz',
        password_confirmation: 'Trashz'
      )
      user1.save

      user2 = User.new(
        first_name: 'Trash', 
        last_name: 'Raccoons',
        email: 'recyclingsucks@gmail.com', 
        password: 'Trashy',
        password_confirmation: 'Trashy'
      )
      user2.save

      expect(user1).to be_valid
      expect(user2).to_not be_valid

    end 
    
  end 

  describe '.authenticate_with_credentials' do 
    it 'should login with everything filled in regularly/correctly' do 
      user = User.new(
        first_name: 'Bun',
        last_name: 'Ny',
        email: 'karrots@gmail.com',
        password: 'carrotsKarrotsCARROTS!',
        password_confirmation: 'carrotsKarrotsCARROTS!'
      )
      user.save

      authenticated_user = User.authenticate_with_credentials('karrots@gmail.com', 'carrotsKarrotsCARROTS!')
      expect(authenticated_user).to eq(user)
    end 

    it 'should login successfully with capitals in the email' do 
      user = User.new(
        first_name: 'Dale', 
        last_name: 'Chip',
        email: 'chipanddale4life@gmail.com',
        password: 'C&DF!!',
        password_confirmation: 'C&DF!!'
      )
      user.save

      authenticated_user = User.authenticate_with_credentials('CHIPandDALE4life@gmail.com', 'C&DF!!')
      expect(authenticated_user).to eq(user)
    end 

    it 'should login successfully with leading and trailing spaces in the email' do 
      user = User.new(
      first_name: 'Quir', 
      last_name: 'Rel',
      email: 'fullofnuts@yahoo.com', 
      password: 'Cashews',
      password_confirmation: 'Cashews'
      )
      user.save

      authenticated_user = User.authenticate_with_credentials(' fullofnuts@yahoo.com ', 'Cashews')
      expect(authenticated_user).to eq(user)
    end 

    it 'should not login successfully with wrong password' do 
      user = User.new(
      first_name: 'Quir', 
      last_name: 'Rel',
      email: 'fullofnuts@yahoo.com', 
      password: 'Cashews',
      password_confirmation: 'Cashews'
      )
      user.save

      authenticated_user = User.authenticate_with_credentials(' fullofnuts@yahoo.com ', 'Apples')
      expect(authenticated_user).to_not eq(user)
    end 
    
    it 'should login successfully with leading and trailing spaces in the email' do 

      authenticated_user = User.authenticate_with_credentials('nuts@yahoo.com', 'Nuts')
      expect(authenticated_user).to be_nil
    end 
  end 
end 
