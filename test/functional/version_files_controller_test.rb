require 'test_helper'

class VersionFilesControllerTest < ActionController::TestCase
  setup do
    @version_file = version_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:version_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create version_file" do
    assert_difference('VersionFile.count') do
      post :create, version_file: @version_file.attributes
    end

    assert_redirected_to version_file_path(assigns(:version_file))
  end

  test "should show version_file" do
    get :show, id: @version_file.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @version_file.to_param
    assert_response :success
  end

  test "should update version_file" do
    put :update, id: @version_file.to_param, version_file: @version_file.attributes
    assert_redirected_to version_file_path(assigns(:version_file))
  end

  test "should destroy version_file" do
    assert_difference('VersionFile.count', -1) do
      delete :destroy, id: @version_file.to_param
    end

    assert_redirected_to version_files_path
  end
end
