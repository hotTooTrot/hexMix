require 'test_helper'

class Api::HexesControllerTest < ActionController::TestCase
  def setup
    @hex = hexes(:one)  
  end

  test 'GET #index' do
    get :index, format: :json
    assert_response 200
    responded = JSON.parse(response.body)[0]
    assert_equal @hex.hex1, responded['#fff']
    assert_equal @hex.hex2, responded['#fff']
    assert_equal @hex.hex3, responded['#fff']
    assert_equal @hex.hex4, responded['#fff']
    assert_equal @hex.hex5, responded['#fff']
  end
end
