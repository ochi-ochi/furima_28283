class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :purchase_add

  # with_options presence: true do
  #   validates :user
  #   validates :items
  # end
end
