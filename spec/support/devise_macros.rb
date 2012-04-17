module ValidUserRequest

  def sign_in_as
    @user ||= FactoryGirl.create(:user)
    post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
  end

end