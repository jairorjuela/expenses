class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :purchase

  validates :name, :date_expense, :category_id, :purchase_id, presence: true
  validates :amount, presence: true, numericality: true

  by_star_field :date_expense

  scope :this_month, -> { where(date_expense: Time.now.beginning_of_month..Time.now.end_of_month) }

  scope :last_month, -> { where(:date_expense => 1.month.ago.beginning_of_month..1.month.ago.end_of_month) }

  scope :six_month, -> { where(:date_expense => 6.month.ago.beginning_of_month..1.month.ago.end_of_month) }

  scope :by_today, -> { where(:date_expense => Date.today) }

  scope :get_sum, -> { self.sum(:amount)}
  scope :get_count, -> { self.count}
  scope :average_expense, -> { self.sum(:amount) / self.count(:id) }

  def self.full_column_names
    column_names.collect {|name| "\"#{table_name}\".\"#{name}\"" }
  end

end
