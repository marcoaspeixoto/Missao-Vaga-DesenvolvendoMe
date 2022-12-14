class Account < ApplicationRecord
  belongs_to :supplier
  validates_presence_of :account_number
  before_save :digit_number

  def self.search(query)
    where("account_number like ?", "%#{query}%")
  end

  private

  def digit_number
    self.digit = DigitCalculation.new(account_number).calculate_digit
  end
end
