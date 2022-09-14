class CreateCities

  def perform
    puts "Creating cities..."
    states = State.all.as_json

    states.each do |state|
      state_abbreviation = state["abbreviation"]

      cities_resp = RestClient.get("https://brasilapi.com.br/api/ibge/municipios/v1/#{state_abbreviation}?providers=dados-abertos-br,gov,wikipedia")
      array_cities = JSON.parse(cities_resp.body)

      array_cities.each do |city_hash|
        city_name = city_hash["nome"]
        city_codigo_ibge = city_hash["codigo_ibge"]

        city_db = City.find_by(name: city_name, ibge_code: city_codigo_ibge)

        if !city_db
          City.create!(
            name: city_hash["nome"],
            ibge_code: city_hash["codigo_ibge"],
          	state_id: state["id"]
          )
        end

      end

    end
    puts "Cities created successfully!"

  end

end