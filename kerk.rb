require_relative 'foo.rb'

begin
  # C function
  #File.open()

  # Ruby function, multiple args
  #Foo.new.bar()

  # Ruby function, just missing kw_arg
  Foo.new.bar2()

  # Proc
  #x = ->(a,b) {}
  #x.call()
rescue => e
  e
  puts "~~~~~~~~~"
  recv = e.instance_variable_get("@receiver");
  meth = e.instance_variable_get("@method_name");

  puts "recv: #{recv}"
  puts "method: #{meth}"
  p recv && meth && recv.method(meth).parameters
  puts "^^^^^^^^"
  fail
end
