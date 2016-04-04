# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sort_alphabetical"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = "2015-08-14"
  s.email = "michael@grosser.it"
  s.homepage = "https://github.com/grosser/sort_alphabetical"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Sort UTF8 Strings alphabetical via Enumerable extension"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<unicode_utils>, [">= 1.2.2"])
    else
      s.add_dependency(%q<unicode_utils>, [">= 1.2.2"])
    end
  else
    s.add_dependency(%q<unicode_utils>, [">= 1.2.2"])
  end
end
