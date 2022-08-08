class PlantPlotsController < ApplicationController
  def destroy
    plant = Plant.find(params[:plant_id])
    plot = Plot.find(params[:plot_id])
    plant_plot = PlantPlot.find_by(plant: plant, plot: plot)
    plant_plot.destroy
    redirect_to "/plots"
  end
end
