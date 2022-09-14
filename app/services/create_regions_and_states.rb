class CreateRegionsAndStates

  def perform
    resp = RestClient.get("https://brasilapi.com.br/api/ibge/uf/v1")
    array = JSON.parse(resp.body)

    puts "Creating regions..."
    array.each do |state_hash|
      region_hash = state_hash["regiao"]

      region_abbreviation = region_hash["sigla"]
      region_name = region_hash["nome"]

      region_db = Region.find_by(abbreviation: region_abbreviation, name: region_name)

      if !region_db
        Region.create!(
          abbreviation: region_hash["sigla"],
          name: region_hash["nome"]
        )
      end

    end
    puts "Regions created successfully"

    puts "Creating states..."
    # array = array.sort_by { |hash| hash['nome'] }
    array.each do |state_hash|

      state_abbreviation = state_hash["sigla"]
      state_name = state_hash["nome"]
      state_region_id = state_hash["regiao"]["id"]

      state_db = State.find_by(abbreviation: state_abbreviation, name: state_name, region_id: state_region_id)

      if !state_db
        State.create!(
          abbreviation: state_hash["sigla"],
          name: state_hash["nome"],
          region_id: state_hash["regiao"]["id"]
        )
      end

    end
    puts "States created successfully"

  end

end