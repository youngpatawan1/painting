require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "valid login/logout" do
    get login_path
    post login_path, params: {session: {email: @user.email,
      password: "password"}}
    assert is_logged_in?
    assert redirected_to @user
    follow_redirect!
    assert_template 'users/show'

    assert "a[href=?]", login_path, count: 0
    assert "a[href=?]", logout_path, count: 1
    assert "a[href=?]", @user, count: 1

    delete logout_path
    assert_not is_logged_in?
    assert redirected_to root_url
    end
end
