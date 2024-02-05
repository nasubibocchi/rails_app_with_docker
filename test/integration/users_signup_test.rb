require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path

    assert_no_difference 'User.count' do
      assert_select 'form[action="/signup"]'
      ## assert_no_difference 'User.count'と post users_path で実行される処理
      # before_count = User.count
      # post users_path, ...
      # after_count  = User.count
      # assert_equal before_count, after_count
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    # users/new ページにとどまることを確認
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end

  test 'invalid name' do
    get signup_path

    assert_no_difference 'User.count' do
      assert_select 'form[action="/signup"]'
      post signup_path, params: { user: { name:  "",
                                         email: "user@example.com",
                                         password:              "foobar",
                                         password_confirmation: "foobar" } }
    end
    assert_select 'div[id=?]>ul>li','error_explanation' ,'Name can\'t be blank'
  end
end
