Pod::Spec.new do |spec|
  spec.name                   = "RKDialogbox"
  spec.version                = "0.1.1"
  spec.summary                = "Custom UI"
  spec.description            = "Custom UIAlertController"
  spec.homepage               = "https://github.com/merichle/RKDialogbox"
  spec.social_media_url       = "https://twitter.com/Merichle"
  spec.license                = "MIT"
  spec.author                 = { "Ramazan Karami" => "ramazan.karami@gmail.com" }
  spec.platform               = :ios, "11.0"
  spec.ios.deployment_target  = '11.0'
  spec.source                 = { :git => "https://github.com/merichle/RKDialogbox.git", :tag => spec.version.to_s }
  spec.source_files           = "RKDialogbox/Main/**/*.*"
  spec.resources              = "RKDialogbox/Resources/*.*"
  spec.swift_version          = "5.0"
end
