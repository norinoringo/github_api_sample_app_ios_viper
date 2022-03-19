# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

# インストールするpodをまとめた定数
def install_pods
 # CocoaPodsで入れたライブラリのWarningを消す
 inhibit_all_warnings!

 pod 'SwiftFormat/CLI'
 pod 'SwiftLint'
 pod 'R.swift'
 pod 'PromisesSwift'
 pod 'SkeletonView'
 pod 'Nuke'
 pod 'LicensePlist'
end

target 'github_api_sample_app_ios_viper' do
 install_pods
end

target 'github_api_sample_app_ios_viperTests' do
 install_pods
end

target 'github_api_sample_app_ios_viperUITests' do
 install_pods
end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
  end
 end
end
