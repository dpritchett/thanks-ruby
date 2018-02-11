require "thanks/version"
require "thanks/registry"

module Thanks
  def self.print_list

    if matches.any?
      puts "\nSweet! You are using gems with donation pages!\n\n"
      matches.sort.each { |name, url| puts " - #{name}\t#{url}" }
    else
      puts "\nMan! Can't find any gems on your system to support!"
    end

    puts "\nYou can also donate to help the Ruby language itself"
    puts "\thttps://bugs.ruby-lang.org/projects/ruby/wiki/Donation"

    puts "\nAdd more gem donation links to our list at"
    puts "\thttps://github.com/dpritchett/thanks-ruby"
  end

  def self.matches
    @_matches ||= REGISTRY.select do |name, url|
      system_gems.include?(name) ||
        bundled_gems.include?(name)
    end
  end

  def self.system_gems
    @_system_gems ||= `gem list`.split("\n").map(&:split).map(&:first)
  end

  def self.bundled_gems
    @_bundled_gems ||= `bundle list`
      .split("\n")
      .drop(1).map(&:split)
      .map { |words| words.drop(1) }
      .map(&:first)
  end
end
