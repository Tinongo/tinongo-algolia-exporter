# frozen_string_literal: true

=begin
  This script exports all records from a given Algolia index and writes data to
  a JSON file in data/ folder.
=end

require 'yaml'
require 'json'
require 'algoliasearch'

# Set up local environment vars
ENV_FILE = './local_env.yml'

if File.exist?(ENV_FILE)
  YAML.load(File.open(ENV_FILE)).each do |key, value|
    ENV[key.to_s] = value
  end
else
  abort "Couldn't load ENV_FILE!"
end

print "Please enter Algolia index to export: "
index_to_export = gets
index_to_export.chomp!
exit if index_to_export.nil? or index_to_export.empty?

Algolia.init(application_id: ENV['ALGOLIA_APP_ID'],
             api_key: ENV['ALGOLIA_API_KEY'])

index = Algolia::Index.new(index_to_export)

hits = []

index.browse do |hit|
  hits.push(hit)
end

hits.each do |hit|
  puts hit
end

File.write("./data/#{index_to_export}_export_#{Time.now.strftime('%FT%T')}.json", hits.to_json)
