#!/usr/bin/env ruby
# vim: et ts=2 sw=2

class TestReminder < MiniTest::Unit::TestCase
  def setup
    @cls = ICloud::Records::Reminder
  end

  def test_complete?
    incomplete = @cls.new
    complete = @cls.new.tap { |r| r.completed_date = DateTime.now }
    refute incomplete.complete?
    assert complete.complete?
  end

  def test_complete
    incomplete = @cls.new
    assert_nil complete.completed_date
    incomplete.complete
    assert complete.completed_date.is_a?(Array)
    assert_equal 7, complete.completed_date.length
  end
end
