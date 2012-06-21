# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "bunchr"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joe Miller"]
  s.date = "2012-04-17"
  s.description = "A DSL for building complex software projects and packaging them (RPM, DEB, etc).\nOriginally developed to create \"omnibus\" style packages that include an entire\nruby stack along with one or more gems, but useful for general compilation and\npackaging as well.\n"
  s.email = "joeym@joeym.net"
  s.homepage = "https://github.com/joemiller/bunchr"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A DSL for bundling complex software projects into 'omnibus'-style packages."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.8.7"])
      s.add_runtime_dependency(%q<ohai>, [">= 0"])
      s.add_runtime_dependency(%q<systemu>, [">= 0"])
      s.add_runtime_dependency(%q<fpm>, ["~> 0.4.6"])
    else
      s.add_dependency(%q<rake>, [">= 0.8.7"])
      s.add_dependency(%q<ohai>, [">= 0"])
      s.add_dependency(%q<systemu>, [">= 0"])
      s.add_dependency(%q<fpm>, ["~> 0.4.6"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.8.7"])
    s.add_dependency(%q<ohai>, [">= 0"])
    s.add_dependency(%q<systemu>, [">= 0"])
    s.add_dependency(%q<fpm>, ["~> 0.4.6"])
  end
end
