//
//  Tab.swift
//  DeepLink
//
//  Created by henry on 2023/9/23.
//

import Foundation

/// TabView Tabs
enum Tab:String, CaseIterable {
    case home = "Home"
    case favourite = "Favourite"
    case settings = "Settings"
    
    var symbolImage:String {
        switch self {
        case .home:
            return "house.fill"
        case .favourite:
            return "heart.fill"
        case .settings:
            return "gear"
        }
    }
    
    static func convert(from:String) -> Self?{
        return Tab.allCases.first{ tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
