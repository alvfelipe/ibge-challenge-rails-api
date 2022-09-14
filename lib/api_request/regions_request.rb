require 'rest-client'
require 'json'

def regions_request
	aux1 = 1
	aux2 = 1
	aux3 = 1
	aux4 = 1

	resp = RestClient.get("https://brasilapi.com.br/api/ibge/uf/v1")
	array = JSON.parse(resp.body)

	region1 = array[0]["regiao"]
	region2 = array[aux1]["regiao"]
	region3 = array[aux2]["regiao"]
	region4 = array[aux3]["regiao"]
	region5 = array[aux4]["regiao"]

	while region2 == region1
		aux1 += 1
		region2 = array[aux1]["regiao"]
	end

	while region3 == region1 || region3 == region2
		aux2 += 1
		region3 = array[aux2]["regiao"]
	end

	while region4 == region1 || region4 == region2 || region4 == region3
		aux3 += 1
		region4 = array[aux3]["regiao"]
	end

	while region5 == region1 || region5 == region2 || region5 == region3 || region5 == region4
		aux4 += 1
		region5 = array[aux4]["regiao"]
	end

	regions = [region1, region2, region3, region4, region5]
end