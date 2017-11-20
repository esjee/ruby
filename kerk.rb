require_relative 'foo.rb'

begin
  #File.open()
  Foo.new.bar()
rescue => e
  e
  puts "~~~~~~~~~"
  recv = e.instance_variable_get("@receiver");
  meth = e.instance_variable_get("@method_name");

  puts recv
  puts meth
  puts recv.method(meth).parameters
  puts "^^^^^^^^"
  fail
end
