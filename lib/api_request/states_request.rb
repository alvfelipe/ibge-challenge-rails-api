require 'rest-client'
require 'json'

def states_request

	resp = RestClient.get("https://brasilapi.com.br/api/ibge/uf/v1")
	array = JSON.parse(resp)

	index = 0
	states = array[index].except("regiao")

	while states != array.last 
		index += 1
	end

	puts states

end