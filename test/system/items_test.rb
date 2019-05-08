# frozen_string_literal: true

require 'application_system_test_case'

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:item_one)
  end

  test 'visiting the items index for all items' do
    # VCR.use_cassette('webdriver_call') do
      visit items_url
      assert_selector 'h1', text: 'Items'
    # end
  end

  test 'filter resolution lh' do
    # VCR.use_cassette('webdriver_call') do
      visit items_url
      assert_equal 4, page.all(:css, 'tr.data').size
      find(:css, '#item-filter').find(:option, 'Resolution LH').select_option
      assert_equal 3, page.all(:css, 'tr.data').size
    # end
  end
end
