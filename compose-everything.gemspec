Gem::Specification.new do |spec|
  spec.name          = 'compose-everything'
  spec.version       = '0.0.0'
  spec.authors       = ['trajing', 'strikingwolf']
  spec.email         = ['trajingplaysgames@gmail.com', 'strikingwolf2012@gmail.com']

  spec.summary       = 'Composition and other functional goodies for objects supporting the #[] and #[]= methods.'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3.0"
end
