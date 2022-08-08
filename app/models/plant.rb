class Plant < ApplicationRecord
  has_many :plant_plots
  has_many :plots, through: :plant_plots

  def self.under_100
    where("days_to_harvet < ?", 100)
  end
end
