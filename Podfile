# Uncomment the next line to define a global platform for your project
platform :ios, '17.2'

target 'Talysh Disctionary' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'SwiftLint'
  #pod 'SQLite'
  pod 'SQLite.swift', '~> 0.14.0'
  
end


post_install do |installer|
     installer.generated_projects.each do |project|
         project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
                  end
              end
          end
      end
