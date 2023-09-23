//
//  Home.swift
//  DeepLink
//
//  Created by henry on 2023/9/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var appData:AppData
    
    var body: some View {
        TabView(selection: $appData.activeTab,
                content:  {
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Image(systemName: Tab.home
                        .symbolImage)
                }
            FavouriteView()
                .tag(Tab.favourite)
                .tabItem {
                    Image(systemName: Tab.favourite
                        .symbolImage)
                }
            SettingView()
                .tag(Tab.settings)
                .tabItem {
                    Image(systemName: Tab.settings
                        .symbolImage)
                }
            
        })
        .tint(.red)
    }
    
    
    @ViewBuilder
    func HomeView() -> some View{
        NavigationStack(path: $appData.homeNavStack){
            List {
                ForEach(HomeStack.allCases, id:\.rawValue){ link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomeStack.self) { link in
                Text(link.rawValue)
            }
        }
    }
    
    @ViewBuilder
    func FavouriteView() -> some View{
        NavigationStack(path: $appData.favourateNavStack){
            List {
                ForEach(FavourateStack.allCases, id:\.rawValue){ link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Favourite")
            .navigationDestination(for: FavourateStack.self) { link in
                Text(link.rawValue)
            }
        }
    }
    
    @ViewBuilder
    func SettingView() -> some View{
        NavigationStack(path: $appData.settingNavStack){
            List {
                ForEach(SettingStack.allCases, id:\.rawValue){ link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Setting's")
            .navigationDestination(for: SettingStack.self) { link in
                Text(link.rawValue)
            }
        }
    }
    
}

#Preview {
    Home()
        .environmentObject(AppData())
}
