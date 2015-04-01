#!/usr/bin/env ruby
require 'Qt'
require './life.rb'
ap "life is short...    75 * 12 = #{(75*12).to_s}"
ap "23 * 12 = #{(23*12).to_s}"

app = Qt::Application.new ARGV
life = Life.new
life.age = 23
life.month = 4
life.show

app.exec

