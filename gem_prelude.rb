#if defined?(Gem)
#https://bugs.ruby-lang.org/issues/14111  require 'rubygems.rb'
#  begin
#    gem 'did_you_mean'
#    require 'did_you_mean'
#  rescue Gem::LoadError, LoadError
#  end if defined?(DidYouMean)
#end
