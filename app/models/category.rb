class Category < ApplicationRecord
  belongs_to :user
  has_many :category_expenditures, foreign_key: :category_id, dependent: :destroy
  has_many :expenditures, through: :category_expenditures

  validates :name, presence: true, length: { in: 1..80 }
  validates :icon, presence: true
  validates :description, presence: true, length: { in: 1..150 }

  def total_expenses
    expenditures.sum('amount')
  end
end
