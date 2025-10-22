//
//  ContentView.swift
//  WhatsAppClone
//
//  Created by Turker Alan on 13.10.2025.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab: Tab = .chats
    
    init() {
        //makeTabBarOpaque()
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            UpdatesTabScreen()
                .tabItem {
                    Image(systemName: Tab.updates.icon(isSelected: selectedTab == .updates))
                    Text(Tab.updates.title)
                }
                .tag(Tab.updates)
            
            CallsTabScreen()
                .tabItem {
                    Image(systemName: Tab.calls.icon(isSelected: selectedTab == .calls))
                        .environment(\.symbolVariants, .none)
                    Text(Tab.calls.title)
                }
                .tag(Tab.calls)
            
            CommunitiesTabScreen()
                .tabItem {
                    Image(systemName: Tab.communities.icon(isSelected: selectedTab == .communities))
                        .environment(\.symbolVariants, .none)
                    Text(Tab.communities.title)
                }
                .tag(Tab.communities)
            
            ChatsTabScreen()
                .tabItem {
                    Image(systemName: Tab.chats.icon(isSelected: selectedTab == .chats))
                        .environment(\.symbolVariants, .none)
                    Text(Tab.chats.title)
                }
                .tag(Tab.chats)
            
            SettingsTabScreen()
                .tabItem {
                    Image(systemName: Tab.settings.icon(isSelected: selectedTab == .settings))
                    Text(Tab.settings.title)
                }
                .tag(Tab.settings)
        }
    }
    
    private func makeTabBarOpaque() {
        let appearence = UITabBarAppearance()
        appearence.configureWithOpaqueBackground()
        
        UITabBar.appearance().standardAppearance = appearence
        UITabBar.appearance().scrollEdgeAppearance = appearence

    }
}

extension MainTabView {
    private func placeholderView(_ title: String) -> some View {
        ScrollView {
            VStack {
                ForEach(0..<120) { _ in
                    Text(title)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(Color.green.opacity(0.4))
                }
            }
        }
        
    }
    
    private enum Tab: String {
        case updates, calls, communities, chats, settings
        
        fileprivate var title: String {
            return rawValue.capitalized
        }
        
        fileprivate func icon(isSelected: Bool) -> String {
            return isSelected ? selectedIcon : unselectedIcon
        }
        
        fileprivate var selectedIcon: String {
            switch self {
            case .updates:
                return "inset.filled.circle.dashed"
            case .calls:
                return "phone.fill"
            case .communities:
                return "person.3.fill"
            case .chats:
                return "message.fill"
            case .settings:
                return "gear.circle"
            }
        }
        
        fileprivate var unselectedIcon: String {
            switch self {
            case .updates:
                return "circle.dashed"
            case .calls:
                return "phone"
            case .communities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
}
#Preview {
    MainTabView()
}
