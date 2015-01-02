platform :ios, '8.1'
pod "OpenCV"

# インストール前に行われるアクション
pre_install do |installer_representation|
  system "gem update --system"
  system "gem update cocoapods"
  p "install started"
end

# インストール後に行われるアクション
post_install do |installer_representation|
  p "install finished!"
end
