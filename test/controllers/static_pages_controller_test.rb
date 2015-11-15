require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

	def setup
		@base_title = "Goodreads book reviews"
	end 

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | #{@base_title}" 
  end

end
