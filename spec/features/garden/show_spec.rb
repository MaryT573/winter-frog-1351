require 'rails_helper'

RSpec.describe "Garden show" do
  it 'shows a unique list of plants that are under 100 days' do
    garden = Garden.create!(name: 'Turing Community Garden', organic: true)

    plot1 = garden.plots.create!(number: 25, size: "Large", direction: "East")
    plot2 = garden.plots.create!(number: 26, size: "Small", direction: "West")

    plant1 = Plant.create!(name: "rose", description: "a rose", days_to_harvet: 150)
    plant2 = Plant.create!(name: "cucumber", description: "a cucumber", days_to_harvet: 15)
    plant3 = Plant.create!(name: "pumpkin", description: "a pumpkin", days_to_harvet: 20)
    plant4 = Plant.create!(name: "lilac", description: "a lilac", days_to_harvet: 3)
    plant5 = Plant.create!(name: "ginger", description: "a ginger plant", days_to_harvet: 8)

    plantplot1 = PlantPlot.create(plant: plant1, plot: plot1)
    plantplot2 = PlantPlot.create(plant: plant2, plot: plot2)
    plantplot3 = PlantPlot.create(plant: plant3, plot: plot1)
    plantplot4 = PlantPlot.create(plant: plant4, plot: plot2)
    plantplot5 = PlantPlot.create(plant: plant5, plot: plot1)
    plantplot6 = PlantPlot.create(plant: plant5, plot: plot2)

    visit "/gardens/#{garden.id}"
    
    expect(page).to_not have_content(plant1.name)

    expect(page).to have_content(plant2.name)
    expect(page).to have_content(plant3.name)
    expect(page).to have_content(plant4.name)
    expect(page).to have_content(plant5.name)
  end
end
