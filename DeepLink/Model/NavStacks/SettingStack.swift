//
//  SettingStack.swift
//  DeepLink
//
//  Created by henry on 2023/9/23.
//

import SwiftUI

/// Home View Nav Links
enum SettingStack:String, CaseIterable {
    case myProfile = "My Profile"
    case dataUsage = "Data usage"
    case privacyPolicy = "Privacy Policy"
    case termsOfService = "Terms of service"
    
    static func conver(from:String) -> Self?{
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
