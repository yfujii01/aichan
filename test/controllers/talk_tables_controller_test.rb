require 'test_helper'

class TalkTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @talk_table = talk_tables(:one)
  end

  test "should get index" do
    get talk_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_talk_table_url
    assert_response :success
  end

  test "should create talk_table" do
    assert_difference('TalkTable.count') do
      post talk_tables_url, params: { talk_table: { input: @talk_table.input, message: @talk_table.message, tag: @talk_table.tag } }
    end

    assert_redirected_to talk_table_url(TalkTable.last)
  end

  test "should show talk_table" do
    get talk_table_url(@talk_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_talk_table_url(@talk_table)
    assert_response :success
  end

  test "should update talk_table" do
    patch talk_table_url(@talk_table), params: { talk_table: { input: @talk_table.input, message: @talk_table.message, tag: @talk_table.tag } }
    assert_redirected_to talk_table_url(@talk_table)
  end

  test "should destroy talk_table" do
    assert_difference('TalkTable.count', -1) do
      delete talk_table_url(@talk_table)
    end

    assert_redirected_to talk_tables_url
  end
end
