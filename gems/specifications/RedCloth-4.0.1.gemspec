Gem::Specification.new do |s|
  s.name = %q{RedCloth}
  s.version = "4.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Garber"]
  s.date = %q{2008-07-23}
  s.default_executable = %q{redcloth}
  s.description = %q{RedCloth-4.0.1 - Textile parser for Ruby. http://redcloth.org/}
  s.email = %q{redcloth-upwards@rubyforge.org}
  s.executables = ["redcloth"]
  s.extensions = ["ext/redcloth_scan/extconf.rb"]
  s.extra_rdoc_files = ["README", "CHANGELOG", "COPYING"]
  s.files = ["CHANGELOG", "COPYING", "README", "Rakefile", "bin/redcloth", "test/basic.yml", "test/code.yml", "test/definitions.yml", "test/extra_whitespace.yml", "test/filter_html.yml", "test/filter_pba.yml", "test/helper.rb", "test/html.yml", "test/images.yml", "test/instiki.yml", "test/links.yml", "test/lists.yml", "test/poignant.yml", "test/sanitize_html.yml", "test/table.yml", "test/test_custom_tags.rb", "test/test_extensions.rb", "test/test_formatters.rb", "test/test_parser.rb", "test/test_restrictions.rb", "test/textism.yml", "test/threshold.yml", "test/validate_fixtures.rb", "lib/case_sensitive_require", "lib/case_sensitive_require/RedCloth.rb", "lib/redcloth", "lib/redcloth/formatters", "lib/redcloth/formatters/base.rb", "lib/redcloth/formatters/html.rb", "lib/redcloth/formatters/latex.rb", "lib/redcloth/formatters/latex_entities.yml", "lib/redcloth/textile_doc.rb", "lib/redcloth/version.rb", "lib/redcloth.rb", "lib/redcloth_scan.bundle", "extras/mingw-rbconfig.rb", "extras/ragel_profiler.rb", "ext/redcloth_scan/redcloth.h", "ext/redcloth_scan/redcloth_attributes.c", "ext/redcloth_scan/redcloth_inline.c", "ext/redcloth_scan/redcloth_scan.c", "ext/redcloth_scan/extconf.rb", "ext/redcloth_scan/redcloth_attributes.rl", "ext/redcloth_scan/redcloth_common.rl", "ext/redcloth_scan/redcloth_inline.rl", "ext/redcloth_scan/redcloth_scan.rl"]
  s.has_rdoc = true
  s.homepage = %q{http://redcloth.org/}
  s.require_paths = ["lib", "lib/case_sensitive_require"]
  s.rubyforge_project = %q{redcloth}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{RedCloth-4.0.1 - Textile parser for Ruby. http://redcloth.org/}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end
