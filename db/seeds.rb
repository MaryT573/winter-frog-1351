garden1 = Garden.create!(name: 'Turing Community Garden', organic: true)
garden2 = Garden.create!(name: 'Public Library Garden', organic: true)

plot1 = garden1.plots.create!(number: 25, size: "Large", direction: "East")
plot2 = garden1.plots.create!(number: 26, size: "Small", direction: "West")
plot3 = garden2.plots.create!(number: 2, size: "Small", direction: "South")
plot4 = garden2.plots.create!(number: 738, size: "Medium", direction: "West")

plant1 = Plant.create!(name: "rose", description: "a rose", days_to_harvet: 10)
plant2 = Plant.create!(name: "cucumber", description: "a cucumber", days_to_harvet: 15)
plant3 = Plant.create!(name: "pumpkin", description: "a pumpkin", days_to_harvet: 20)
plant4 = Plant.create!(name: "lilac", description: "a lilac", days_to_harvet: 3)
plant5 = Plant.create!(name: "ginger", description: "a ginger plant", days_to_harvet: 8)

plantplot1 = PlantPlot.create(plant: plant1, plot: plot1)
plantplot2 = PlantPlot.create(plant: plant2, plot: plot2)
plantplot3 = PlantPlot.create(plant: plant3, plot: plot3)
plantplot4 = PlantPlot.create(plant: plant4, plot: plot4)
plantplot5 = PlantPlot.create(plant: plant5, plot: plot1)
plantplot6 = PlantPlot.create(plant: plant1, plot: plot2)
