require 'test_helper'

class PluginVersionsControllerTest < ActionController::TestCase
  setup do
    @plugin_version = plugin_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plugin_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plugin_version" do
    assert_difference('PluginVersion.count') do
      post :create, plugin_version: @plugin_version.attributes
    end

    assert_redirected_to plugin_version_path(assigns(:plugin_version))
  end

  test "should show plugin_version" do
    get :show, id: @plugin_version.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plugin_version.to_param
    assert_response :success
  end

  test "should update plugin_version" do
    put :update, id: @plugin_version.to_param, plugin_version: @plugin_version.attributes
    assert_redirected_to plugin_version_path(assigns(:plugin_version))
  end

  test "should destroy plugin_version" do
    assert_difference('PluginVersion.count', -1) do
      delete :destroy, id: @plugin_version.to_param
    end

    assert_redirected_to plugin_versions_path
  end
end
