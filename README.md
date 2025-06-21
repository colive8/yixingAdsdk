# YixingAdsdk

[![Version](https://img.shields.io/cocoapods/v/YixingAdsdk.svg?style=flat)](https://cocoapods.org/pods/YixingAdsdk)
[![License](https://img.shields.io/cocoapods/l/YixingAdsdk.svg?style=flat)](https://cocoapods.org/pods/YixingAdsdk)
[![Platform](https://img.shields.io/cocoapods/p/YixingAdsdk.svg?style=flat)](https://cocoapods.org/pods/YixingAdsdk)

## 简介

YixingAdsdk是一个轻量级的iOS广告SDK，用于在iOS应用中展示插屏广告。广告以竖图形式展示，并在右上角提供关闭按钮，该按钮在显示1秒后可点击关闭广告。

## 功能特点

- 简单易用的API
- 支持自定义广告图片
- 提供默认测试广告图片
- 广告关闭回调
- 轻量级设计，最小化对应用性能的影响

## 安装

### CocoaPods

YixingAdsdk可通过[CocoaPods](https://cocoapods.org)安装。只需将以下行添加到您的Podfile中：

```ruby
pod 'YixingAdsdk'
```

然后运行：

```bash
pod install
```

### Swift Package Manager

YixingAdsdk也支持[Swift Package Manager](https://swift.org/package-manager/)。

在Xcode中，选择`File > Add Packages...`，然后输入以下URL：

```
https://github.com/colive8/yixingAdsdk.git
```

## 使用方法

### 导入SDK

```swift
import YixingAdsdk
```

### 显示插屏广告

```swift
// 使用默认测试广告图片
if let adImage = YixingAdsdk.shared.defaultAdImage() {
    YixingAdsdk.shared.showInterstitialAd(in: self, adImage: adImage) {
        print("广告已关闭")
    }
}

// 或者使用自定义广告图片
if let customImage = UIImage(named: "your_ad_image") {
    YixingAdsdk.shared.showInterstitialAd(in: self, adImage: customImage) {
        print("广告已关闭")
    }
}
```

## 示例

SDK包含一个示例视图控制器，展示如何使用YixingAdsdk：

```swift
import UIKit
import YixingAdsdk

class YourViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个按钮来显示广告
        let button = UIButton(type: .system)
        button.setTitle("显示广告", for: .normal)
        button.addTarget(self, action: #selector(showAd), for: .touchUpInside)
        
        // 添加按钮到视图
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(button)
    }
    
    @objc func showAd() {
        if let adImage = YixingAdsdk.shared.defaultAdImage() {
            YixingAdsdk.shared.showInterstitialAd(in: self, adImage: adImage) {
                print("广告已关闭")
            }
        }
    }
}
```

## 要求

- iOS 13.0+
- Swift 5.0+

## 作者

colive8

## 许可证

YixingAdsdk 基于 MIT 许可证发布。详情请参阅 LICENSE 文件。