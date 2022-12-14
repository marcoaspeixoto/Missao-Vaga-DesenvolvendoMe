class Supplier < ApplicationRecord
  has_one :account
  has_many :parts
  validates_presence_of :name, :cnpj
  validate :validate_cnpj

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  private

  def validate_cnpj
    errors.add(:cnpj, "CNPJ inválido! Por favor, tente novamente.") unless CNPJ.valid?(cnpj)
  end
end