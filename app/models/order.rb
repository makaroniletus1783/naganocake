class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum pay_method: { credit_card: 0, transfer: 1 }
  enum status: { pay_waiting: 0, pay_check: 1, producing: 2, ship_waiting: 3, shipping: 4 }
end
