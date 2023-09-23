//
//  DeepLinkApp.swift
//  DeepLink
//
//  Created by henry on 2023/9/23.
//

import SwiftUI

@main
struct DeepLinkApp: App {
    
    @StateObject private var appData:AppData = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                .onOpenURL(perform: { url in
                    let string = url.absoluteString.replacingOccurrences(of: "txvideo://", with: "")
                    print(string)
                    let components = string.components(separatedBy: "?")
                    
                    for component in components{
                        if component.contains("tab="){
                            /// 请求切换Tab
                            let tabRawValue = component.replacingOccurrences(of: "tab=", with: "")
                            if let tabRawValue = Tab.convert(from: tabRawValue) {
                                appData.activeTab = tabRawValue
                            }
                            print(tabRawValue)
                        }
                        
                        if component.contains("nav=") && string.contains("tab"){
                            /// 请求切换Nav
                            let requestNavPath = component
                                .replacingOccurrences(of: "nav=", with: "")
                                .replacingOccurrences(of: "_", with: " ")
                            print( appData.activeTab )
                            switch appData.activeTab {
                            case .home:
                                if let navPath = HomeStack.conver(from: requestNavPath){
                                    appData.homeNavStack.append(navPath)
                                }
                            case .favourite:
                                if let navPath = FavourateStack.conver(from: requestNavPath){
                                    appData.favourateNavStack.append(navPath)
                                }
                            case .settings:
                                if let navPath = SettingStack.conver(from: requestNavPath){
                                    appData.settingNavStack.append(navPath)
                                }
                            }}
                    }
                })
        }
    }
}
