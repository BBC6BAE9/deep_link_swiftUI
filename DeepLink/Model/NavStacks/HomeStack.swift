//
//  HomeStack.swift
//  DeepLink
//
//  Created by henry on 2023/9/23.
//

import SwiftUI

/// Home View Nav Links
enum HomeStack:String, CaseIterable {
    case myPosts = "My Posts"
    case oldPosts = "Old Posts"
    case latesPosts = "latest Posts"
    
    static func conver(from:String) -> Self?{
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
