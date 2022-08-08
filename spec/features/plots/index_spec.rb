require 'rails_helper'

RSpec.describe "Plots index" do
  it 'has a list of all plots and thier associated plants' do
    garden1 = Garden.create!(name: 'Turing Community Garden', organic: true)
    plot1 = garden1.plots.create!(number: 25, size: "Large", direction: "East")
    plot2 = garden1.plots.create!(number: 26, size: "Small", direction: "West")
    plant1 = Plant.create!(name: "rose", description: "a rose", days_to_harvet: 10)
    plant2 = Plant.create!(name: "cucumber", description: "a cucumber", days_to_harvet: 15)
    plant3 = Plant.create!(name: "pumpkin", description: "a pumpkin", days_to_harvet: 20)
    plantplot1 = PlantPlot.create(plant: plant1, plot: plot1)
    plantplot2 = PlantPlot.create(plant: plant2, plot: plot1)
    plantplot3 = PlantPlot.create(plant: plant3, plot: plot2)
    plantplot4 = PlantPlot.create(plant: plant1, plot: plot2)

    visit '/plots'
    expect(current_path).to eq('/plots')

    within "#plots-#{plot1.id}" do
      expect(page).to have_content(plot1.number)
      expect(page).to have_content(plant1.name)
      expect(page).to have_content(plant2.name)
      expect(page).to_not have_content(plant3.name)
    end

    within "#plots-#{plot2.id}" do
      expect(page).to have_content(plot2.number)
      expect(page).to have_content(plant1.name)
      expect(page).to have_content(plant3.name)
      expect(page).to_not have_content(plant2.name)
    end
  end

  it 'can remove plant from plot without deleteing plant' do
    garden1 = Garden.create!(name: 'Turing Community Garden', organic: true)
    plot1 = garden1.plots.create!(number: 25, size: "Large", direction: "East")
    plot2 = garden1.plots.create!(number: 26, size: "Small", direction: "West")
    plant1 = Plant.create!(name: "rose", description: "a rose", days_to_harvet: 10)
    plant2 = Plant.create!(name: "cucumber", description: "a cucumber", days_to_harvet: 15)
    plantplot1 = PlantPlot.create(plant: plant1, plot: plot1)
    plantplot2 = PlantPlot.create(plant: plant2, plot: plot1)
    plantplot4 = PlantPlot.create(plant: plant1, plot: plot2)

    visit '/plots'

    within "#plots-#{plot1.id}" do
      expect(page).to have_content(plant1.name)
      expect(page).to have_content(plant2.name)
      expect(page).to have_link("Remove #{plant1.name}")
      expect(page).to have_link("Remove #{plant2.name}")
      click_link("Remove #{plant1.name}")
    end

    expect(current_path).to eq('/plots')

    within "#plots-#{plot2.id}" do
      expect(page).to have_content(plant1.name)
    end

    within "#plots-#{plot1.id}" do
      expect(page).to_not have_content(plant1.name)
      expect(page).to have_content(plant2.name)
      expect(page).to_not have_link("Remove #{plant1.name}")
      expect(page).to have_link("Remove #{plant2.name}")
    end
  end
end
