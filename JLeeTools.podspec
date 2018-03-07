

Pod::Spec.new do |s|
  s.name             = 'JLeeTools'
  s.version          = '0.2.4'
  s.summary          = 'differentiate package'
  s.description      = 'A demo for test now, and it will be convenient to develope iOS Apps by obj-c'
  s.homepage         = 'https://github.com/lijie28/JLeeTools'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lijie9228@hotmail.com' => 'lijie9228@hotmail.com' }
  s.source           = { :git => 'https://github.com/lijie28/JLeeTools.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  # s.dependency 'AFNetworking', '~> 2.0'
  s.source_files = 'JLeeTools/Classes/*'

  s.subspec 'NetWork' do |snk|
      snk.source_files = 'JLeeTools/Classes/NetWork/**/*'
      snk.public_header_files = 'JLeeTools/Classes/NetWork/**/*.h'
      snk.dependency 'AFNetworking', '~> 2.3'
  end

  s.subspec 'JLeeCategory' do |sjc|
      sjc.source_files = 'JLeeTools/Classes/JLeeCategory/**/*'
      sjc.public_header_files = 'JLeeTools/Classes/JLeeCategory/**/*.h'
  end
  
end
