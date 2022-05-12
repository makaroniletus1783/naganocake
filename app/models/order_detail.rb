class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { unable: 0, produce_wating: 1, producing: 2, complete: 3 }

  def subtotal
     item.with_tax_price * amount
  end
end
