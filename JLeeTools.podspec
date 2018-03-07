

Pod::Spec.new do |s|
  s.name             = 'JLeeTools'
  s.version          = '0.2.2'
  s.summary          = ' network bugs fix'

  s.description      = 'A demo for test now, and it will be convenient to develope iOS Apps by obj-c'

  s.homepage         = 'https://github.com/lijie28/JLeeTools'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lijie9228@hotmail.com' => 'lijie9228@hotmail.com' }
  s.source           = { :git => 'https://github.com/lijie28/JLeeTools.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'JLeeTools/Classes/**/*'
  s.dependency 'AFNetworking', '~> 2.0'
  
end
