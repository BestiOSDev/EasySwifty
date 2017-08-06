
Pod::Spec.new do |s|

s.name                 = 'EasySwity'
s.version              = "0.0.2"
s.license              = { :type => 'MIT', :file => 'LICENSE' }
s.summary              = '对 Swift 的 Foundation 和 UIKit 进行了一定的拓展 ,使其代码更加简洁 复用性高'
s.homepage             = 'https://github.com/ZhaoBingDong/EasySwifty'
s.author               = { "ZhaoBingDong" => "dongzhaobing@bayekeji.com" }
s.source                   = { :git => 'https://github.com/ZhaoBingDong/EasySwifty.git', :tag => "0.0.2" }
s.ios.deployment_target = '9.0'
s.source_files = 'EasySwity/**/*'
s.requires_arc = true


end
