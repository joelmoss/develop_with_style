
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "develop_with_style/version"

Gem::Specification.new do |spec|
  spec.name          = "develop_with_style"
  spec.version       = DevelopWithStyle::VERSION
  spec.authors       = ["Joel Moss"]
  spec.email         = ["joel@developwithstyle.com"]

  spec.summary       = %q{Enjoy writing CSS in your Rails application and Develop With Style!}
  spec.description   = %q{Create global and local CSS with very little effort.}
  spec.homepage      = "https://github.com/joelmoss/develop_with_style"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
