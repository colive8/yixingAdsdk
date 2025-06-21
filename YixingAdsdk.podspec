#
# Be sure to run `pod lib lint YixingAdsdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YixingAdsdk'
  s.version          = '0.1.0'
  s.summary          = 'A simple interstitial ad SDK for iOS applications.'

  s.description      = <<-DESC
YixingAdsdk is a lightweight SDK that allows developers to easily integrate interstitial ads into their iOS applications. The SDK displays a vertical image ad with a close button in the top-right corner that becomes clickable after 1 second.
                       DESC

  s.homepage         = 'https://github.com/colive8/yixingAdsdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'colive8' => 'developer@example.com' }
  s.source           = { :git => 'https://github.com/colive8/yixingAdsdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.source_files = 'YixingAdsdk/Sources/**/*'
  
  s.resource_bundles = {
    'YixingAdsdk' => ['YixingAdsdk/Assets/*.png']
  }

  s.frameworks = 'UIKit'
end