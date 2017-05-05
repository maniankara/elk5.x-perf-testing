#!/usr/bin/env ruby

require 'json'

JSON.parse(File.open(ARGV[0]).read).each do |obj|
	cmd = "curl -X POST #{ARGV[1]}/regional_data?pretty -d '#{obj.to_json}'"
	puts "executing command: #{cmd}"
	`#{cmd}`
end