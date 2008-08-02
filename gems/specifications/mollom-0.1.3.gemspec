Gem::Specification.new do |s|
  s.name = %q{mollom}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jan De Poorter"]
  s.date = %q{2008-06-16}
  s.email = %q{mollom@openminds.be}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["lib/mollom.rb", "README.rdoc", "test/content_response_test.rb", "test/mollom_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{mollom.rubyforge.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{mollom}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Ruby class for easy interfacing with the mollom.com open API for spam detection and content quality assesment.}
  s.test_files = ["test/content_response_test.rb", "test/mollom_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
