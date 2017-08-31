#!/usr/bin/env ruby

require_relative '_base'
require 'reality/data_sources/wikidata'

titles = ARGV.dup

source = Reality::DataSources::Wikidata.new

titles.each do |t|
  puts "#{t}\n" + "="*t.length + "\n"

  observations = source.get(t)
  #pp observations['claims'].select { |k, v| v.count > 1 }.map{|k,v| [k, v.count]}.to_h
  observations.each { |name, val| puts '%s: %p' % [name, val] }
end
