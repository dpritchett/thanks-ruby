require 'test_helper'

class ThanksTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Thanks::VERSION
  end

  def test_it_lists_system_gems
    result = Thanks.system_gems

    # this one's in the travis build and i have it locally,
    # could be a better test
    assert result.include? 'rubocop'
  end

  def test_it_lists_bundled_gems
    result = Thanks.bundled_gems
    assert result.include? 'rubocop'
  end

  def test_it_loads_local_registry
    result = Thanks::Registry.new.local
    assert result.keys.include? 'gemstash'
  end

  def test_it_loads_remote_registry
    result = Thanks::Registry.new.remote
    assert result.keys.include? 'gemstash'
  end
end
