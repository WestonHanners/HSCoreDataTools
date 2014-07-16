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
