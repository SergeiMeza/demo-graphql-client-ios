platform :ios, '13.0'
use_frameworks!

workspace 'demo-client-ios'

def foundation_pods
  pod 'SwifterSwift'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'SwiftyJSON', '~> 4.0'
end

def networking_pods
  pod 'Alamofire', '~> 5.0.0-rc.3'
  pod 'Apollo'
end

def ui_pods
  pod 'SnapKit', '~> 5.0.0'
  pod 'IGListKit', '~> 3.0'
  pod 'Kingfisher', '~> 5.6.0'
  pod 'JGProgressHUD','~>2.0.3'
end

######################################
## FRAMEWORKS

target 'UIComponents' do
  project 'UIComponents/UIComponents.xcodeproj'
  foundation_pods
  ui_pods
end

######################################
## APPS

target 'demo-client-ios' do
  project 'demo-client-ios.xcodeproj'
  foundation_pods
  networking_pods
  ui_pods
end

target 'UIComponentsDemo' do
  project 'UIComponentsDemo/UIComponentsDemo.xcodeproj'
  foundation_pods
  ui_pods
end
