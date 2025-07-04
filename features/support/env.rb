require 'json-schema'
require 'httparty'
require 'faker'
require 'rspec'
require 'report_builder'
require_relative '../pages/dog_api'

Dir.mkdir('test_results') unless File.directory?('test_results')
Dir.mkdir('report_builder') unless File.directory?('report_builder')

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'report.json'
    config.report_path = 'report_builder/regression_dogapi'
    config.report_types = [:html]
    config.report_title = 'AgiBank - Regression Test DogApi'
    config.color = 'indigo'
    config.include_images = true
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.additional_info = {
      'Ambiente' => 'Desenvolvimento',
      'Browser' =>  'Chrome',
      'Tipo do Teste' => 'API - BackEnd',
      'Cliente' => 'AGIBANK'

    }
  end

  ReportBuilder.build_report
end
