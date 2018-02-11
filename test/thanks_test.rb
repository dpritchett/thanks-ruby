require "test_helper"

class ThanksTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Thanks::VERSION
  end

  def test_it_lists_gems
    result = Thanks.system_gems
    
    assert result.include? 'thanks'
  end
end
