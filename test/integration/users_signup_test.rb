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
    # users/new ページに移動することを確認
    assert_template 'users/new'
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
