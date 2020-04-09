module ControllerMacros

  def login_user
    before(:each) do
      user = FactoryBot.create(:user, email: 'leonardo@gmail.com')

      sign_in user

      user
    end
  end
end
