# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{my_ldap_authenticator}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Diego Carrion"]
  s.date = %q{2009-02-17}
  s.email = %q{dc.rec1@gmail.com}
  s.files = ["lib/my_ldap_authenticator.rb", "lib/my_ldap.rb", "README.textile", "Rakefile"]
  s.homepage = %q{http://www.diegocarrion.com}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{my_ldap_authenticator}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A simple authenticator for a simple LDAP servers}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
