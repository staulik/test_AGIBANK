class DogAPI
  include HTTParty
  base_uri 'https://dog.ceo/api'

  def listar_racas
    self.class.get('/breeds/list/all')
  end

  def imagens_da_raca(raca)
    self.class.get("/breed/#{raca}/images")
  end

  def imagem_aleatoria
    self.class.get('/breeds/image/random')
  end

  def enviar_requisicao(resposta)
    if resposta.code == 200
      @response = resposta
    else
      raise "Falha na requisição. Código de status: #{resposta.code}"
    end
  end

  def resposta_valida?
    @response && @response.body && !@response.body.empty?
  end

  def parsed
    if resposta_valida?
      JSON.parse(@response.body)
    else
      raise "Resposta inválida ou vazia"
    end
  end

  def salvar_evidencia(nome_arquivo)
    if resposta_valida?
      conteudo = parsed["message"]

      File.open("test_results/#{nome_arquivo}", "w") do |f|
        f.puts JSON.pretty_generate(conteudo)
      end

      # Impressão condicional com base no tipo da resposta
      if conteudo.is_a?(Hash)
        puts "Raças retornadas: #{conteudo.keys.join(', ')}"
      elsif conteudo.is_a?(Array)
        puts "Imagens retornadas: #{conteudo.first(5).join(', ')}"
      else
        puts "Conteúdo retornado: #{conteudo}"
      end
    else
      raise "Nenhuma resposta válida para salvar"
    end
  end

  def validar_urls_imagens
    imagens = parsed["message"]
    salvar_evidencia("evidencia_imagens_raca.json")
    raise "URL inválida" unless imagens.all? { |url| url.match?(/https?:\/\/.*\.(jpg|jpeg|png)/) }
  end

  def validar_url_imagem_aleatoria
    imagem = parsed["message"]
    salvar_evidencia("evidencia_imagem_aleatoria.json")
    puts "Imagem retornada: #{imagem}"
    raise "URL inválida" unless imagem.match?(/https?:\/\/.*\.(jpg|jpeg|png)/)
  end

  def validar_lista_racas
    racas = parsed["message"].keys
    salvar_evidencia("evidencia_racas.json")
    puts "Raças retornadas: #{racas.join(', ')}"
    raise "Poucas raças retornadas" unless racas.size > 5
  end

  def validar_schema(schema_path)
    schema = JSON.parse(File.read(schema_path))
    JSON::Validator.validate!(schema, @response.body, strict: true)
  end
end
