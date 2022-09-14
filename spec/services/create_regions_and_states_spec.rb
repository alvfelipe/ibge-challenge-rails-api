require 'rails_helper'

RSpec.describe "Regions" do
	
	context 'instance methods' do
		context '#perform' do
			
			it do
        create = CreateRegionsAndStates.new
        create.perform
				expect(Region.count).to eq(5)
				expect(State.count).to eq(27)
			end

		end
	end

end