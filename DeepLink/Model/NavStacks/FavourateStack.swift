//
//  FavourateStack.swift
//  DeepLink
//
//  Created by henry on 2023/9/23.
//

import SwiftUI

/// Home View Nav Links
enum FavourateStack:String, CaseIterable {
    case iJstine = "iJstine"
    case kaviya = "kaviya"
    case jenna = "Jenna"
    
    static func conver(from:String) -> Self?{
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
