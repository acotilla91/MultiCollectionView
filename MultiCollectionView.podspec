Pod::Spec.new do |s|
  s.name             = 'MultiCollectionView'
  s.version          = '1.0.0'
  s.summary          = 'UICollectionView capable to scroll in both directions, vertically and horizontally.'
  
  s.description      = <<-DESC
  MultiCollectionView allows for multidirectional scrolling (horizontal and vertical scrolling) on iOS or tvOS, similar to Netflix and most other media consumption apps out there.
  DESC
  
  s.homepage         = 'https://github.com/acotilla91/MultiCollectionView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alejandro Cotilla' => 'acotilla91@gmail.com' }
  s.source           = { :git => 'https://github.com/acotilla91/MultiCollectionView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/acotilla91'
  
  s.ios.deployment_target = '10.0'
  s.tvos.deployment_target = '10.0'
  s.swift_version = '5.0'
  
  s.source_files = 'MultiCollectionView/Classes/**/*'
  
end
