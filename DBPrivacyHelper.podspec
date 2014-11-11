Pod::Spec.new do |s|
  s.name         = "DBPrivacyHelper"
  s.version      = "0.2"
  s.summary      = "Quick category to explain the right place to enable your privacy settings"

  s.description  = <<-DESC
                    Quick UIViewController category to explain the right place to enable your privacy settings
                    DESC

  s.homepage     = "https://github.com/danielebogo/DBPrivacyHelper"
  s.license      = "MIT"
  s.author             = { "Daniele Bogo" => "me@bogodaniele.com" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/danielebogo/DBPrivacyHelper.git", :tag => "0.2" }

  s.source_files  = "DBPrivacyHelper/*.{h,m}"
  s.resources = ['DBPrivacyHelper/*.{xib,xcassets}', 'DBPrivacyHelper/DBPrivacyHelperLocalizations/**']

  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
