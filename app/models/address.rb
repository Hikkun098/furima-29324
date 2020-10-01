class Address < ApplicationRecord
  belongs_to :order
  with_options presence: true do
  end
end
