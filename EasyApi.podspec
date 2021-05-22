#
# Be sure to run `pod lib lint EasyApi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyApi'
  s.version          = '0.1.0'
  s.summary          = 'Perform Api calls easily and efficiently with EasyApi'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Perform Api calls easily and efficiently with EasyApi. Inbuilt usage of Dispatch Queues, so no need to worry about performance anymore. Make use of Dispatch Group easily with EasyApi."

  s.homepage         = 'https://github.com/saikiranpanuganti/EasyApi'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'saikiranpanuganti' => 'saikiranpanuganti92@gmail.com' }
  s.source           = { :git => 'https://github.com/saikiranpanuganti/EasyApi.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'EasyApi/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EasyApi' => ['EasyApi/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
