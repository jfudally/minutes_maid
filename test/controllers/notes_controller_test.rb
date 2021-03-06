# frozen_string_literal: true

require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
    @item = items(:item_one)
    @note = notes(:note_one)
  end

  test 'should get index' do
    get notes_url

    assert_response :success
    assert response.body.include? @note.text
  end

  test 'should get index for one item' do
    note_three = notes(:note_three)
    get notes_url, params: { item_id: @item.id }

    assert_response :success
    assert response.body.include? @note.text
    assert !response.body.include?(note_three.text)
  end

  test 'should get new' do
    get new_note_url, params: { item_id: @item.id }
    assert_response :success
  end

  test 'should create note' do
    assert_difference('Note.count') do
      post notes_url, params: { note: { text: @note.text, item_id: @item.id } }
    end

    assert_redirected_to note_url(Note.last)
  end

  test 'should error when failing to create note' do
    assert_difference('Note.count', 0) do
      post notes_url, params: { note: { text: nil, item_id: nil } }
    end

    assert response.body.include? '1 error prohibited this note from being saved'
  end

  test 'should show note' do
    get note_url(@note)
    assert_response :success
  end

  test 'should get edit' do
    get edit_note_url(@note)
    assert_response :success
  end

  test 'should update note' do
    patch note_url(@note), params: { note: { text: @note.text, item_id: @item.id } }
    assert_redirected_to note_url(@note)
  end

  test 'should error when failing to update note' do
    patch note_url(@note), params: { note: { text: nil, item_id: nil } }
    assert response.body.include? '1 error prohibited this note from being saved'
  end

  test 'should destroy note' do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end
end
