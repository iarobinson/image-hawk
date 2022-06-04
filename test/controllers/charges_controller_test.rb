require "test_helper"

class ChargesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:coco)
    @charge = charges(:charge_one)
  end

  # test "should not get index" do
  #   get charges_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_charge_url
    assert_response :success
  end

  # test "should create charge" do
  #   TODO: Understand why this test is unprocessable
  #   byebug
  #   assert_difference('Charge.count') do
  #     post charges_url, params: { charge: { 
  #       cancel_url: "www.stripe.com/fake-success-url",
  #       success_url: "www.stripe.com/fake-success-url",
  #       seller_id: User.first.id,
  #       session_id: Session.first.id
  #     } }
  #   end
  #
  #   assert_redirected_to charge_url(Charge.last)
  # end

  test "should show charge" do
    get charge_url(@charge)
    assert_response :success
  end

  test "should get edit" do
    get edit_charge_url(@charge)
    assert_response :success
  end

  # TODO: Charges don't need to be edited by basic users for MVP
  # test "should update charge" do
  #   patch charge_url(@charge), params: { charge: { cancel_url: @charge.cancel_url, success_url: @charge.success_url } }
  #   assert_redirected_to charge_url(@charge)
  # end

  # test "should destroy charge" do

  #   assert_difference('Charge.count', -1) do
  #     delete charge_url(@charge)
  #   end

  #   assert_redirected_to charges_url
  # end
end
