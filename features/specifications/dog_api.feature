# language: pt

Funcionalidade: Verificar a Dog API

  Contexto:
    Dado que a API Dog está disponível

  Cenário: Listar todas as raças disponíveis
    Quando faço a requisição para listar raças
    Então o status da resposta deve ser 200
    E a lista de raças deve conter várias raças

  Cenário: Verificar se a raça 'retriever' está presente na lista
    Quando faço a requisição para listar raças
    Então o status da resposta deve ser 200
    E o corpo deve conter a raça "retriever"

  Cenário: Obter imagem de uma raça específica
    Quando faço a requisição de imagens da raça "retriever"
    Então o status da resposta deve ser 200
    E o corpo deve conter URLs de imagens

  Cenário: Obter imagem aleatória
    Quando faço a requisição de imagem aleatória
    Então o status da resposta deve ser 200
    E o corpo deve conter uma URL de imagem@schema
    
  Cenário: Validar contrato da lista de raças
    Dado que eu faça uma requisição para listar todas as raças
    Então a resposta deve conter status 200
    E valido o schema "features/schemas/schema_lista_racas.json"

@schema_fail
  Cenário: Validar contrato com schema inválido
    Dado que eu faça uma requisição para listar todas as raças
    Então a resposta deve conter status 200
    E valido o schema "features/schemas/schema_errado.json"
