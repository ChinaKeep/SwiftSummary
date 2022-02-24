
Pod::Spec.new do |spec|

 

  spec.name         = "SwiftSummary"
  spec.version      = "0.0.1"
  spec.summary      = "SwiftSummary"
  
  spec.description  = <<-DESC
This is my project and my first Pods
                   DESC

  spec.homepage     = "https://github.com/SuiFengLiuNian/SwiftSummary"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "yinyadong" => "yinyadong@zzpxx.com" }

  spec.ios.deployment_target = '10.0'

  spec.source       = { :git => "https://github.com/SuiFengLiuNian/SwiftSummary.git", :tag => spec.version }


  spec.source_files  = "TestSwiftApplication", "TestSwiftApplication/C++/*.{h,m}"

  

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
