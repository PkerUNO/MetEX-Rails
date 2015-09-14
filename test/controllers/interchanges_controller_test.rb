require 'test_helper'

class InterchangesControllerTest < ActionController::TestCase
	setup do
		@interchange1 = interchanges(:interchange1)
	end

	test "should not get index" do
		get :index
		assert_no_access
	end

	test "should not get new" do
		get :new
		assert_no_access
	end

	test "should not create interchange" do
		post :create, interchange: { name: @interchange1.name }
		assert_no_access
	end

	test "should not show interchange" do
		get :show, id: @interchange1
		assert_no_access
	end

	test "should not get edit" do
		get :edit, id: @interchange1
		assert_no_access
	end

	test "should not update interchange" do
		patch :update, id: @interchange1, interchange: { name: @interchange1.name }
		assert_no_access
	end

	test "should not destroy interchange" do
		delete :destroy, id: @interchange1
		assert_no_access
	end
end