require 'test_helper'

class TodolistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get todolists_new_url
    assert_response :success
  end

end
