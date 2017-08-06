
Pod::Spec.new do |s|

s.name                 = 'EasySwifty'
s.version              = "1.0.1"
s.license              = { :type => 'MIT', :file => 'LICENSE' }
s.summary              = '对 Swift 的 Foundation 和 UIKit 进行了一定的拓展 ,使其代码更加简洁 复用性高'
s.homepage             = 'https://github.com/ZhaoBingDong/EasySwifty'
s.author               = { "ZhaoBingDong" => "dongzhaobing@bayekeji.com" }
s.source               = { :git => 'https://github.com/ZhaoBingDong/EasySwifty.git', :tag => "1.0.1" }
s.ios.deployment_target = '10.0'
# s.source_files = 'EasySwifty/EasySwifty.swift'
s.source_files = 'EasySwifty/**/*{.swift}'
s.requires_arc = true


end
