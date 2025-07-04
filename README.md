# 🧪 test_AGIBANK - Automação de Testes de API em Ruby

Projeto de automação de testes de API desenvolvido como parte de um desafio técnico. Utiliza Ruby com Cucumber para estruturar testes de forma clara, modular e legível.

---

## 🚀 Tecnologias Utilizadas

- **Ruby**
- **Cucumber**
- **HTTParty**
- **JSON**
- **ReportBuilder**
- **GitHub Actions (CI)**

---

## 📁 Estrutura do Projeto

aut_api_dog/
│
├── features/ # Features com cenários BDD
│ ├── step_definitions/ # Implementações dos passos
│ └── support/ # Hooks e configurações
│
├── report_builder/ # Configuração de relatórios
├── test_results/ # Relatórios HTML gerados
├── spec/ # (se usado para testes unitários)
│
├── cucumber.yml # Perfis de execução
├── Gemfile # Dependências do projeto
├── report.json # Saída de execução em JSON
├── README.md # Este arquivo
└── TESTE TÉCNICO API.pdf # Documento original do desafio


---

## ▶️ Como Executar os Testes

1. Instale as dependências:

```bash
bundle install
Execute os testes com o perfil padrão:

bundle exec cucumber -p default

O relatório será gerado em:

test_results/Resultado_Testes.html
🔄 Integração Contínua (GitHub Actions)
Este projeto está configurado com uma pipeline automatizada que roda os testes a cada push ou pull request na branch main.

Arquivo de workflow:
.github/workflows/api_tests.yml

## 📊 Relatórios

Após a execução dos testes, dois tipos de relatórios são gerados automaticamente:

### ✅ 1. Relatório Cucumber (Padrão)

Gerado diretamente pelo Cucumber com saída estruturada em JSON, HTML ou no terminal (pretty).

- Arquivo JSON:  
report.json

- Arquivo HTML (se configurado no perfil):  
test_results/Resultado_Testes.html

Esse relatório mostra os cenários, passos, resultados e logs básicos da execução.


### ✅ 2. Relatório Customizado (ReportBuilder)

Gerado com base no `report.json`, esse relatório tem layout mais amigável, visual limpo e informações consolidadas.

- Caminho:  
report_builder/regression_dogapi.html

- Conteúdo:
- Cenários pass/fail
- Tabela resumo
- Gráficos de status
- Tempo total de execução

---

🤝 Contribuições
Sinta-se à vontade para sugerir melhorias ou enviar pull requests.
Esse projeto é um exercício técnico e pode evoluir com novas abordagens e boas práticas!


