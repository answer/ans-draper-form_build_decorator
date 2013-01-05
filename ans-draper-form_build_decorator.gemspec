# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ans-draper-form_build_decorator/version'

Gem::Specification.new do |gem|
  gem.name          = "ans-draper-form_build_decorator"
  gem.version       = Ans::Draper::FormBuildDecorator::VERSION
  gem.authors       = ["sakai shunsuke"]
  gem.email         = ["sakai@ans-web.co.jp"]
  gem.description   = %q{draper 用 form 生成用 module}
  gem.summary       = %q{decorator クラスに include すると便利ソッドを追加する}
  gem.homepage      = "https://github.com/answer/ans-draper-form_build_decorator"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
