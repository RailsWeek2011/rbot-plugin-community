require 'test_helper'

class PluginsControllerTest < ActionController::TestCase
  setup do
    @plugin = plugins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plugins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plugin" do
    assert_difference('Plugin.count') do
      post :create, plugin: @plugin.attributes
    end

    assert_redirected_to plugin_path(assigns(:plugin))
  end

  test "should show plugin" do
    get :show, id: @plugin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plugin.to_param
    assert_response :success
  end

  test "should update plugin" do
    put :update, id: @plugin.to_param, plugin: @plugin.attributes
    assert_redirected_to plugin_path(assigns(:plugin))
  end

  test "should destroy plugin" do
    assert_difference('Plugin.count', -1) do
      delete :destroy, id: @plugin.to_param
    end

    assert_redirected_to plugins_path
  end
end
