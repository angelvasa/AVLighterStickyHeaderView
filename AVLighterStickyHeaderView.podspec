#
#  Be sure to run `pod spec lint AVLighterStickyHeaderView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |spec|
spec.name         = 'AVLighterStickyHeaderView'
spec.version      = '0.1'
spec.license      = { :type => 'MIT' }
spec.homepage     = 'https://github.com/angelvasa/AVLighterStickyHeaderView'
spec.authors      = { 'Angel Vasa' => 'vasaangel91@gmail.com' }
spec.summary      = "Sticky header view inspired from android coordinate layout"
spec.source       = { :git => "https://github.com/angelvasa/AVLighterStickyHeaderView.git", :tag => "0.1" }
spec.source_files = "AVLighterStickyHeaderView", "AVLighterStickyHeaderView/*.{swift}"
spec.platform = :ios
spec.ios.deployment_target = '8.0'
end

