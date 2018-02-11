require "thanks/version"
require "thanks/registry"

module Thanks
  def self.print_list
    matches = REGISTRY.select do |name, url|
      system_gems.include?(name)
    end

    if matches.any?
      puts "Sweet! You are using gems with donation pages!\n\n"
      matches.each { |name, url| puts " - #{name}\t#{url}" }
    end

  end

  def self.system_gems
    @_system_gems ||= `gem list`.split("\n").map(&:split).map(&:first)
  end
end
