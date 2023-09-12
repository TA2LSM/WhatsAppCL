# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'WhatsAppCL' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WhatsAppCL
  pod 'FirebaseCore'
  pod 'FirebaseAuth'
  pod 'FirebaseStorage'
  pod 'FirebaseFirestore'

  pod 'IQAudioRecorderController'
  pod 'JSQMessagesViewController', '7.3.3'
  pod 'IDMPhotoBrowser'
  pod 'RNCryptor'
  pod 'ProgressHUD'
  pod 'MBProgressHUD'
  pod 'ImagePicker', :git => 'https://github.com/hyperoslo/ImagePicker.git'

  post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
     end
  end

end
