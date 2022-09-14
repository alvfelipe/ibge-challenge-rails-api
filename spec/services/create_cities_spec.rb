require 'rails_helper'

RSpec.describe "Cities" do

  context 'instance methods' do
    context '#perform' do

      it do
        create = CreateCities.new
        create.perform
        expect(City.count).to eq(5570)
      end

    end
  end

end