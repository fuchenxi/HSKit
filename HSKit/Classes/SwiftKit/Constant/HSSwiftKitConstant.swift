//
//  HSConstant.swift
//  iShow
//
//  Created by 付晨曦 on 2022/10/25Tuesday.
//

import Foundation

struct AppInfo {
    static let appID = "6444712803"
    static let recaptchaKey = "6Lfx0y4hAAAAABUqWJLeTKeEd4dw5bf7azn5PX9c"
    static let appsFlyerDevKey = "s65Qwen4wrDnGaeogacJEm"
}

/// 顶部安全距离
var kSafeAreaTop: CGFloat {
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let window = windowScene.windows.first else { return 0 }
        return window.safeAreaInsets.top
    } else if #available(iOS 11.0, *) {
        guard let window = UIApplication.shared.windows.first else { return 0 }
        return window.safeAreaInsets.top
    }
    return 0;
}

/// 底部安全距离
var kSafeAreaBottom: CGFloat {
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let window = windowScene.windows.first else { return 0 }
        return window.safeAreaInsets.bottom
    } else if #available(iOS 11.0, *) {
        guard let window = UIApplication.shared.windows.first else { return 0 }
        return window.safeAreaInsets.bottom
    }
    return 0;
}

/// 顶部状态栏高度（包括安全区）
var kStatusBarHeight: CGFloat {
    var height: CGFloat = 0
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first
        guard let windowScene = scene as? UIWindowScene else { return 0 }
        guard let statusBarManager = windowScene.statusBarManager else { return 0 }
        height = statusBarManager.statusBarFrame.height
    } else {
        height = UIApplication.shared.statusBarFrame.height
    }
    return height
}

/// 导航栏高度
var kNavigationBarHeight: CGFloat = 44.0

/// 状态栏 + 导航栏的高度
var kNavigationFullHeight: CGFloat = kStatusBarHeight + kNavigationBarHeight

/// TabBar 高度
var kTabBarHeight: CGFloat = 49.0
    
/// TabBar + 底部安全距离高度
var kTabBarFullHeight: CGFloat = kTabBarHeight + kNavigationFullHeight
    
/// 屏幕宽度
var kScreenWidth: CGFloat {
    return UIScreen.main.bounds.size.width
}

/// 屏幕高度
var kScreenHeight: CGFloat {
    return UIScreen.main.bounds.size.height
}

/// 缩放比例 由于使用了ceil() 函数, 所以传值value要大于零, 否则会有误差, 如需负数,请在宏前面添加 -
func kScale(_ value: CGFloat) -> CGFloat {
    return ceil(kScreenWidth / 375.0 * value)
}


// MARK: - Margin Constant
var kMargin20: CGFloat = kScale(20)
var kMargin18: CGFloat = kScale(18)
var kMargin16: CGFloat = kScale(16)
var kMargin14: CGFloat = kScale(14)
var kMargin12: CGFloat = kScale(12)
var kMargin10: CGFloat = kScale(10)
var kMargin8: CGFloat = kScale(8)
var kMargin6: CGFloat = kScale(6)
var kMargin4: CGFloat = kScale(4)


// MARK: - Radius Constant
var kRadius16: CGFloat = kScale(16)
var kRadius10: CGFloat = kScale(10)
var kRadius8: CGFloat = kScale(8)
var kRadius4: CGFloat = kScale(4)

var kBannerRatio: CGFloat = 65.0 / 363.0

func kBannerHeight(width: CGFloat) -> CGFloat {
    return kBannerRatio * width
}


// MARK: - Line Constant
var kLineWidth: CGFloat = 0.5

typealias kEmptyBlock = () ->()
