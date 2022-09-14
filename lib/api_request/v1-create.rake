require_relative '../api_request/regions_request.rb'
require_relative '../api_request/states_request.rb'

namespace :task do
# ================================================================================================================================ #

  task regions: :environment do
		
		if Region.any? == true
			puts "Regions already created!"
		else
			puts "Creating regions..."

			regions_request.each do |region|
	      Region.create!(
	        name: region["nome"],
	        abbreviation: region["sigla"]
	      )
    	end

    	puts "Regions created successufully!"
		end
  	
	end

# ================================================================================================================================ #

	task states: :environment do

		if State.any? == true
			puts "States already created!"
		else
			puts "Creating states..."

			# states_request.each do |state|
			# 	State.create!(
			# 		name: state["nome"],
			# 		abbreviation: state["sigla"],
			# 		region: Region.all.sample
			# 	)
			# end
			states_request
			puts "States created successufully!"
		end

	end


# ================================================================================================================================ #