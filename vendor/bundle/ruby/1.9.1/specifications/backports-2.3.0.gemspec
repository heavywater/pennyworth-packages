# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "backports"
  s.version = "2.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marc-Andr\u{c3}\u{a9} Lafortune"]
  s.date = "2011-06-23"
  s.description = "      Essential backports that enable some of the really nice features of ruby 1.8.7, ruby 1.9 and rails from ruby 1.8.6 and earlier.\n"
  s.email = "github@marc-andre.ca"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/marcandre/backports"
  s.rdoc_options = ["--charset=UTF-8", "--title", "Backports library", "--main", "README.rdoc", "--line-numbers", "--inline-source"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "backports"
  s.rubygems_version = "1.8.10"
  s.summary = "Backports of Ruby 1.8.7+ for older ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
