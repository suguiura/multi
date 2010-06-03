require 'test_helper'

class MachineTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true
  fixtures :machines, :sessions

  test "should not save machine with no attributes" do
    machine = Machine.new
    assert !machine.save, "Saved the machine with no attributes set"
  end
  test "should be able to use instance from fixtures" do
    assert_not_nil @one_machine
  end
  test "should count total session time" do
    assert_equal 600, @one_machine.total_session_time
    assert_equal 0, @another_machine.total_session_time
  end
  test "should count the number of packages" do
    assert_equal 15, @one_machine.number_of_packages
    assert_equal 0, @another_machine.number_of_packages
  end
  test "should count the number of productive days" do
    assert_equal 2, @one_machine.productive_days
    assert_equal 0, @another_machine.productive_days
  end
  test "should calculate the session time average" do
    assert_equal 200, @one_machine.session_time_average
    assert_equal 0, @another_machine.session_time_average
  end
  test "should calculate the daily session time average" do
    assert_equal 300, @one_machine.daily_session_time_average
    assert_equal 0, @another_machine.daily_session_time_average
  end
  test "should calculate the daily number of packages average" do
    assert_equal 7.5, @one_machine.daily_number_of_packages_average
    assert_equal 0, @another_machine.daily_number_of_packages_average
  end
  test "should calculate the daily productive seconds average" do
    assert_equal 4500, @one_machine.daily_productive_seconds_average
    assert_equal 0, @another_machine.daily_productive_seconds_average
  end
  test "should calculate utilization percent" do
    assert_in_delta 0.009259, @one_machine.utilization_percent, 0.000001
    assert_in_delta 0, @another_machine.utilization_percent, 0.000001
  end
  test "should calculate eficiency percent" do
    assert_in_delta 0.009259, @one_machine.eficiency_percent, 0.000001
    assert_in_delta 0, @another_machine.eficiency_percent, 0.000001
  end
end
