# frozen_string_literal: true

require 'application_system_test_case'

class MeetingsTest < ApplicationSystemTestCase
  setup do
    @meeting = meetings(:meeting_one)
  end

  test 'visiting the index' do
    visit meetings_url
    assert_selector 'h1', text: 'Meetings'
  end

  test 'filter city council' do
    visit meetings_url
    assert_equal 4, page.all(:css, 'tr.data').size
    find(:css, '#meeting-filter').find(:option, 'City Council').select_option
    assert_equal 2, page.all(:css, 'tr.data').size
  end

  test 'no Meetings button, but Items button' do
    visit meetings_url
    assert find(:css, '#items-button')
    assert_equal 0, page.all(:css, '#meetings-button').count
  end
end
