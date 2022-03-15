Pod::Spec.new do |s|
    s.name             = '{{module_name}}DS'
    s.version          = '0.1.0'
    s.summary          = '{{module_name}} Design system Library'
   
    s.homepage         = 'https://github.com/Orangestack-com/uxservices-stackfront-design-system'
    s.author           = { 'Orange' => 'orange@zup.com.br' }
    s.source           = { :git => 'https://github.com/Orangestack-com/uxservices-stackfront-design-system'}
    s.ios.deployment_target = '11.0'
  
    s.source_files = '{{module_name}}/**/*.{swift}'
  
    s.dependency 'Beagle'
  end