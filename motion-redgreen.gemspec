# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-redgreen/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vladimir Pouzanov"]
  gem.email         = ["farcaller@gmail.com"]
  gem.description   = "RedGreen support for RubyMotion"
  gem.summary       = "RedGreen support for RubyMotion"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-redgreen"
  gem.require_paths = ["lib"]
  gem.version       = Motion::Redgreen::VERSION
  
  gem.motion do |motion|
    root_path = File.expand_path('..', __FILE__)
    motion.files = gem.files.grep(%r{^lib/motion-redgreen/app/}).map { |f| File.join(root_path, f) }
    motion.spec_files = gem.files.grep(%r{^lib/motion-redgreen/spec/}).map { |f| File.join(root_path, f) }
  
    motion.pre_build do |config|
      redgreen_style_file = File.join(config.build_dir, 'redgreen_style_config.rb')
      redgreen_style = config.redgreen_style || :focused
  
      File.open(redgreen_style_file, 'wb') do |f|
        f << "$RedGreenStyleFormat = :#{redgreen_style}\n"
      end
  
      motion.spec_files.insert(0, redgreen_style_file)
    end
  end if gem.respond_to?(:motion)
end
