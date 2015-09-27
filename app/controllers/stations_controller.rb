class StationsController < ApplicationController
	before_action :set_line
	before_action :set_station, only: :show
	before_action :set_movements, only: :show

	# GET /stations
	# GET /stations.json
	def index
		@stations = @line.stations
	end

	# GET /stations/1
	# GET /stations/1.json
	def show
		 set_connections if @station.interchange
	end

	private
		# Get Line first due to nested routing
		def set_line
			@line = Line.friendly.find(params[:line_id])
		end

		def set_station
			@station = @line.stations.friendly.find(params[:id])
		end
		
		def set_movements
			@up_movements = @station.up_movements
			@down_movements = @station.down_movements
		end
		
		def set_connections
			@connections = Interchange.find(@station.interchange.id).stations.where.not(id: @station)
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def station_params
			params.require(:station).permit(:name, :line_id, :description, :active, :slug)
		end
end
