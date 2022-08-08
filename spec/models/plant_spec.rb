require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many(:plant_plots)}
    it { should have_many(:plots)}
  end


  describe 'methods' do
    it 'excludes plants with harvests over 100' do
      plant1 = Plant.create!(name: "rose", description: "a rose", days_to_harvet: 150)
      plant2 = Plant.create!(name: "cucumber", description: "a cucumber", days_to_harvet: 200)
      plant3 = Plant.create!(name: "pumpkin", description: "a pumpkin", days_to_harvet: 20)
      plant4 = Plant.create!(name: "lilac", description: "a lilac", days_to_harvet: 3)
      plant5 = Plant.create!(name: "ginger", description: "a ginger plant", days_to_harvet: 8)

      expect(Plant.all.under_100).to eq([plant3, plant4, plant5])
      expect(Plant.all.under_100).to_not eq([plant1, plant2])
    end
  end
end
