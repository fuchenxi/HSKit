//
//  HSStatisticsManager.swift
//  iShow
//
//  Created by 付晨曦 on 2023/1/5Thursday.
//

import Foundation
import AppsFlyerLib

@objc enum HSEventName: Int {
    /// 充值成功
    case rechargeSuccess
    /// 注册成功
    case registSuccess
    /// 激活成功
    case completeInfoSuccess
    /// 登陆成功
    case loginSuccess
    /// 进入了直播间
    case joinRoom
    /// 小助手
    case helper
    /// 翻译
    case clientTransform
    /// 活动弹框
    case dialog
    
    // MARK: - Appear
    /// 充值页面
    case appearRecharge
    
    // MARK: - Click
    /// 点击 Banner
    case clickBanner
    /// 我的页面 Item 点击
    case clickMineItem
    
    func toString() -> String {
        switch self {
            case .rechargeSuccess:
                return "af_purchase"
            case .registSuccess:
                return "af_complete_registration"
            case .completeInfoSuccess:
                return "af_activation"
            case .loginSuccess:
                return "af_login"
            case .joinRoom:
                return "af_join_room"
            case .appearRecharge:
                return "af_open_recharge"
            case .helper:
                return "af_message_notification"
            case .clickBanner:
                return "af_banner"
            case .clickMineItem:
                return "af_mine_action"
            case .clientTransform:
                return "af_system_bullet"
            case .dialog:
                return "af_dialog_activity"
        }
    }
}

@objc enum HSEventKey: UInt {
    case id
    case type
    
    func toString() -> String {
        switch self {
            case .id:
                return "af_content_id"
            case .type:
                return "af_content_type"
        }
    }
}
 
open class HSStatisticsManager: NSObject {
    
    @objc static let shared = HSStatisticsManager()
    
    @objc var userID = ""
    
    override init() {
        super.init()
        
//        if LSUIHelper.sharedInstance().bundleDisplayName() == "iShowLive" {
            let lib = AppsFlyerLib.shared()
            lib.appsFlyerDevKey = AppInfo.appsFlyerDevKey
            lib.appleAppID = AppInfo.appID
            lib.delegate = self
//        }
    }
}

extension HSStatisticsManager: AppsFlyerLibDelegate {

    public func onConversionDataSuccess(_ conversionInfo: [AnyHashable : Any]) {
        
    }
    
    public func onConversionDataFail(_ error: Error) {
        
    }
}

extension HSStatisticsManager {
    
    @objc func logEvent(name: HSEventName) {
        
        logEvent(name: name, values: nil)
    }
    
    @objc func logEvent(name: HSEventName, contentType: String? = nil) {
        
        logEvent(name: name, values: [HSEventKey.type.toString(): contentType ?? ""])
    }
    
    @objc func logEvent(name: HSEventName, contentID: String? = nil, contentType: String? = nil) {
        
        logEvent(name: name, values: [HSEventKey.type.toString(): contentType ?? "",
                                      HSEventKey.id.toString(): contentID ?? ""])
    }
    
    @objc func logEvent(name: HSEventName, values: [AnyHashable: Any]?) {
        
        var params = Dictionary<AnyHashable, Any>()
        values?.forEach({ (key: AnyHashable, value: Any) in
            params.updateValue(value, forKey: key)
        })
        params.updateValue(userID, forKey: "af_customer_user_id")
        
        let eventName = name.toString()
        
        print("Statistics-> name: \(eventName) \t values: \(String(describing: values))")
        
        AppsFlyerLib.shared().logEvent(eventName, withValues: params)
    }
}
