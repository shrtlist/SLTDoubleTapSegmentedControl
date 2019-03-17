Pod::Spec.new do |s|
  s.name         = "SLTDoubleTapSegmentedControl"
  s.version      = "1.0.6"
  s.summary      = "A double-tap UISegmentedControl subclass. Each segment functions as a discrete double-tap button."
  s.description  = <<-DESC
A double-tap UISegmentedControl subclass. Each segment functions as a discrete double-tap button. Based on http://stackoverflow.com/questions/17652773/how-to-deselect-a-segment-in-segmented-control-button-permanently-till-its-click?lq=1
                   DESC
  s.homepage     = "https://github.com/shrtlist/SLTDoubleTapSegmentedControl"
  s.license      = { :type => "Apache 2.0", :file => "LICENSE" }
  s.author             = { "Marco Abundo" => "shrtlist@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/shrtlist/SLTDoubleTapSegmentedControl.git", :tag => "#{s.version}" }
  s.source_files  = "SLTDoubleTapSegmentedControl/SLTDoubleTapSegmentedControl.{h,m}"
  s.module_name = "SLTDoubleTapSegmentedControl"
  s.ios.deployment_target = '10.0'
  s.requires_arc = true
  s.frameworks = ["Foundation", "UIKit"]

end
