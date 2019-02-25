# frozen_string_literal: true

# decorate Item
module ItemHelper
  class << self
    def loc_link(item)
      l = ''
      l = Mappy.link(clean_name(item.name)) if item.item_type.starts_with?('Resolution LH') && !item.file_number.starts_with?('RLH AR')
      l
    end

    def clean_name(name)
      name.gsub('Remove/Repair', '').strip
    end
  end
end
