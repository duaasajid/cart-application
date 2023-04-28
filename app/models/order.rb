class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  before_save :set_user_id

  private

  def set_user_id
    self.user_id ||= 0
  end
  
end
