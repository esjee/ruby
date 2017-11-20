require_relative 'foo.rb'

begin
  #File.open()
  Foo.new.bar()
rescue => e
  e
  puts "~~~~~~~~~"
  puts e.instance_variable_get("@kerk");
  puts $kerk
  puts "^^^^^^^^"
  fail
end
