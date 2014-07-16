#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "HSCoreDataTools"
  s.version          = "1.0.1"
  s.summary          = "Some tools to help speed up development of CoreData backed apps."

  s.homepage         = "https://github.com/kronusdark/HSCoreDataTools"
  s.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { "Weston Hanners" => "admin@hanners.us" }
  s.source           = { :git => "https://github.com/kronusdark/HSCoreDataTools.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/kronusdark'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = '*.{h,m}'

  s.public_header_files = '*.h'
  s.frameworks = 'CoreData'
end
