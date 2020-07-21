#!/usr/bin/env ruby
# -*- mode: ruby -*-

require_relative 'users_application'
require_relative 'rides_application'

map("/users") do
  run UsersApplication.new
end

map("/rides") do
  run RidesApplication.new
end

map("/nested") do
  map("/users") do
    run UsersApplication.new
  end

  map("/rides") do
    run RidesApplication.new
  end
end
