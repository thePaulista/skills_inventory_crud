# require 'bundler'
# Bundler.require
#
# $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/app"))
#
# require 'controllers/skill_inventory_app'

require File.expand_path('../config/environment.rb', __FILE__)

run SkillInventoryApp
