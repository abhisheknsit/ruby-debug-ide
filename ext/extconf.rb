require 'rubygems'
require 'rubygems/command.rb'
require 'rubygems/dependency_installer.rb'

begin
  Gem::Command.build_args = ARGV
  rescue NoMethodError
end

inst = Gem::DependencyInstaller.new
begin
  if RUBY_VERSION < "1.9"
    inst.install "ruby-debug-base", "~> 0.10.3"
  else
    inst.install "ruby-debug-base19", "~> 0.11.15" 
  end
  rescue
    exit(1)
end

# create dummy makefile to indicate success
f = File.open(File.join(File.dirname(__FILE__), "Makefile"), "w")
f.write("install:")
f.close
