require 'test_helper'

class RunTimeEnvironmentTest   < Test::Unit::TestCase

 def test_is_production
      environment = RunTimeEnvironment.get_runtime_environment()
      assert_equal(RunTimeEnvironment::TEST, environment)

      assert_equal(false, RunTimeEnvironment.is_production?)
      assert_equal(true, RunTimeEnvironment.is_test?)

     RunTimeEnvironment.log_runtime_environment()
 end

end