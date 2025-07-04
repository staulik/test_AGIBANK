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

📊 Relatórios
Após a execução dos testes, é gerado um relatório HTML com os resultados, disponível em:


test_results/Resultado_Testes.html
🤝 Contribuições
Sinta-se à vontade para sugerir melhorias ou enviar pull requests.
Esse projeto é um exercício técnico e pode evoluir com novas abordagens e boas práticas!


