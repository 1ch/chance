require 'test_helper'

class CookingsControllerTest < ActionController::TestCase
  setup do
    @cooking = cookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cooking" do
    assert_difference('Cooking.count') do
      post :create, cooking: { assesment: @cooking.assesment, category_id: @cooking.category_id, cooking_name: @cooking.cooking_name, display: @cooking.display, image1: @cooking.image1, image2: @cooking.image2, image3: @cooking.image3, meal_date: @cooking.meal_date, meal_type: @cooking.meal_type, my_comment: @cooking.my_comment, user_id: @cooking.user_id }
    end

    assert_redirected_to cooking_path(assigns(:cooking))
  end

  test "should show cooking" do
    get :show, id: @cooking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cooking
    assert_response :success
  end

  test "should update cooking" do
    put :update, id: @cooking, cooking: { assesment: @cooking.assesment, category_id: @cooking.category_id, cooking_name: @cooking.cooking_name, display: @cooking.display, image1: @cooking.image1, image2: @cooking.image2, image3: @cooking.image3, meal_date: @cooking.meal_date, meal_type: @cooking.meal_type, my_comment: @cooking.my_comment, user_id: @cooking.user_id }
    assert_redirected_to cooking_path(assigns(:cooking))
  end

  test "should destroy cooking" do
    assert_difference('Cooking.count', -1) do
      delete :destroy, id: @cooking
    end

    assert_redirected_to cookings_path
  end
end
