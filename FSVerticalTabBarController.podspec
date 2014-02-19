Pod::Spec.new do |s|
  s.name             = "FSVerticalTabBarController"
  s.version          = "0.1.0"
  s.summary          = "Vertical tab bar controller for iOS mimicking UITabBarController look and behavior"
  s.homepage         = "https://github.com/futuresimple/FSVerticalTabBarController"
  s.screenshots      = "https://github.com/futuresimple/FSVerticalTabBarController/raw/master/images/sample_screenshot.png"
  s.license          = 'MIT'
  s.author           = { "futuresimple" => "bejo@Poland" }
  s.source           = { :git => "https://github.com/ivoryxiong/FSVerticalTabBarController.git", :tag => "0.1.0" }

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'
  s.resources = 'Assets'

  s.public_header_files = 'Classes/**/*.h'
end
