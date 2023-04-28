class AddUserIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :user, default: 0
  end
end
