#
# Be sure to run `pod lib lint ViewGlower.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ViewGlower'
  s.version          = '0.1.0'
  s.summary          = 'Make any UIView glow ✨'
  s.description      = 'UIView, UIButton, UIBarButton, UIImage, button, bar button, image, animate, glow'
  s.homepage         = 'https://github.com/quanvo87/ViewGlower'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'quanvo87' => 'qvo1987@gmail.com' }
  s.source           = { :git => 'https://github.com/quanvo87/ViewGlower.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ViewGlower/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ViewGlower' => ['ViewGlower/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
