Dado("que a API Dog está disponível") do
  @dog_api = DogAPI.new
  @classe = @dog_api
end

Quando("faço a requisição para listar raças") do
  @response = @dog_api.listar_racas
  @classe.enviar_requisicao(@response)
end

Quando("faço a requisição de imagens da raça {string}") do |raca|
  @response = @dog_api.imagens_da_raca(raca)
  @classe.enviar_requisicao(@response)
end

Quando("faço a requisição de imagem aleatória") do
  @response = @dog_api.imagem_aleatoria
  @classe.enviar_requisicao(@response)
end

Então("o status da resposta deve ser {int}") do |status|
  expect(@response.code).to eq(status)
end

Então("o corpo deve conter a raça {string}") do |raca|
  racas = @response.parsed_response["message"].keys
  unless racas.include?(raca)
    raise "Raça '#{raca}' não encontrada na resposta"
  end
  puts "Raça presente: #{raca}"
  expect(racas).to include(raca)
end

Então("o corpo deve conter URLs de imagens") do
  @classe.validar_urls_imagens
end

Então("o corpo deve conter uma URL de imagem") do
  @classe.validar_url_imagem_aleatoria
end

Então("a lista de raças deve conter várias raças") do
  racas = @response.parsed_response["message"].keys
  puts "Raças retornadas: #{racas.join(', ')}"
  @classe.validar_lista_racas
end

Então('valido o schema {string}') do |schema_path|
  @classe.validar_schema(schema_path)
end

Dado('que eu faça uma requisição para listar todas as raças') do
  @response = @dog_api.listar_racas
  @classe.enviar_requisicao(@response)
end

Então('a resposta deve conter status {int}') do |status|
  expect(@response.code).to eq(status)
end

Então('o corpo deve conter uma URL de imagem@schema') do
  imagem = @response.parsed_response["message"]
  puts "Imagem retornada: #{imagem}"
  expect(imagem).to match(/https?:\/\/.*\.(jpg|jpeg|png)/)
end
