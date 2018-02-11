require "test_helper"

class ThanksTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Thanks::VERSION
  end

  def test_it_lists_system_gems
    result = Thanks.system_gems

    # this one's in the travis build and i have it locally,
    # could be a better test
    assert result.include? 'timesheet_nags'
  end

  def test_it_lists_bundled_gems
    result = Thanks.bundled_gems
    assert result.include? 'bundler'
  end
end
