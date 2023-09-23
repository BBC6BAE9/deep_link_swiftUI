//
//  AppData.swift
//  DeepLink
//
//  Created by henry on 2023/9/23.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var activeTab: Tab = .home
    @Published var homeNavStack: [HomeStack] = []
    @Published var favourateNavStack: [FavourateStack] = []
    @Published var settingNavStack: [SettingStack] = []
}
