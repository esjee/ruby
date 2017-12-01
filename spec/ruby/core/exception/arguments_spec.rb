require File.expand_path('../../../spec_helper', __FILE__)

describe "ArgumentError" do
  class ArgumentErrorDummyClass
    def foo(a,b,c:)
    end

    def foo_kw(a:)
    end
  end

  it "is a subclass of StandardError" do
    StandardError.should be_ancestor_of(ArgumentError)
  end

  it "gives its own class name as message if it has no message" do
    ArgumentError.new.message.should == "ArgumentError"
  end

  describe "arity error" do
    it "includes receiver and method name when raised by application code" do
      exc = begin
        ArgumentErrorDummyClass.new.foo(3)
      rescue => exc
        exc
      end

      exc.instance_variable_get('@receiver').should_not be_nil
      exc.instance_variable_get('@receiver').should.class === ArgumentErrorDummyClass
      exc.instance_variable_get('@method_name').should == 'foo'
    end
  end

  describe "kw error" do
    it "includes receiver and method name when raised by application code" do
      exc = begin
        ArgumentErrorDummyClass.new.foo_kw()
      rescue => exc
        exc
      end

      exc.instance_variable_get('@receiver').should_not be_nil
      exc.instance_variable_get('@receiver').should.class === ArgumentErrorDummyClass
      exc.instance_variable_get('@method_name').should == 'foo'
    end
  end
end
