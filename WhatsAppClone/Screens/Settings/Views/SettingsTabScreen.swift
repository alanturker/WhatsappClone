//
//  SettingsTabScreen.swift
//  WhatsAppClone
//
//  Created by Turker Alan on 16.10.2025.
//

import SwiftUI

struct SettingsTabScreen: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    SettingsPersonItemView()
                    NavigationLink(destination: Text("Avatar Page")) {
                        ItemRowView(title: "Avatar", image: "face.smiling")
                    }
                }
                
                Section {
                    ForEach(MessageOptions.allCases, id: \.id) { options in
                        NavigationLink(destination: Text(options.title)) {
                            ItemRowView(title: options.title, image: options.image)
                        }
                    }
                }
                
                Section {
                    ForEach(AccountOptions.allCases, id: \.id) { options in
                        NavigationLink(destination: Text(options.title)) {
                            ItemRowView(title: options.title, image: options.image)
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Help")) {
                        ItemRowView(title: "Help", image: "questionmark.circle")
                    }
                    NavigationLink(destination: Text("Invite a friend")) {
                        ItemRowView(title: "Invite a friend", image: "person.2")
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Accounts Center")) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "apple.intelligence")
                                    .foregroundStyle(Color.whatsAppBlack)
                                    .font(.body)
                                
                                Text("Meta")
                                    .foregroundStyle(Color.whatsAppBlack)
                                    .font(.title3)
                            }
                            .padding(.bottom, 4)
                           
                            Text("Accounts Center")
                                .font(.body)
                            
                            Text("Control your experience across WhatsApp, Facebook, Instagram and more.")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        
                    }
                }
                
                Section("Also from Meta") {
                    NavigationLink(destination: Text("Instagram")) {
                        ItemRowView(title: "Instagram", image: "circle.square")
                    }
                    NavigationLink(destination: Text("Facebook")) {
                        ItemRowView(title: "Facebook", image: "f.circle")
                    }
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $searchText)
        }
    }
}

extension SettingsTabScreen {
    enum MessageOptions: String, CaseIterable, Identifiable {
        case list, broadcast, starred, linked
        
        var id: String {
            self.rawValue
        }
        
        var title: String {
            switch self {
            case .list:
                return "Lists"
            case .broadcast:
                return "Broadcast messages"
            case .starred:
                return "Starred"
            case .linked:
                return "Linked devices"
            }
        }
        
        var image: String {
            switch self {
            case .list:
                return "person.crop.rectangle.stack"
            case .broadcast:
                return "megaphone"
            case .starred:
                return "star"
            case .linked:
                return "laptopcomputer"
            }
        }
    }
    
    enum AccountOptions: String, CaseIterable, Identifiable {
        case account, privacy, chats, notifications, storage
        
        var id: String {
            self.rawValue
        }
        var title: String {
            switch self {
            case .account:
                return "Account"
            case .privacy:
                return "Privacy"
            case .chats:
                return "Chats"
            case .notifications:
                return "Notifications"
            case .storage:
                return "Storage and data"
            }
        }
        
        var image: String {
            switch self {
            case .account:
                return "key"
            case .privacy:
                return "lock"
            case .chats:
                return "message"
            case .notifications:
                return "app.badge"
            case .storage:
                return "arrow.up.arrow.down"
            }
        }
    }
}

private struct SettingsPersonItemView: View {
    var body: some View {
        HStack(alignment: .center) {
            Circle()
                .frame(width: ChatsTabScreen.Constant.imageDimensions,
                       height: ChatsTabScreen.Constant.imageDimensions)
            
            VStack(alignment: .leading) {
                Text("Person Name")
                    .font(.callout)
                    .bold()
                Text("Available")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            Image(systemName: "qrcode")
                .foregroundStyle(.whatsAppBlack)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(6)
                .background(
                    Circle()
                        .foregroundStyle(Color.gray.opacity(0.2))
                )
        }
    }
}

private struct ItemRowView: View {
    let title: String
    let image: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: image)
                .foregroundStyle(Color.whatsAppBlack)
                .font(.body)
            
            Text(title)
                .font(.body)
                .foregroundStyle(Color.whatsAppBlack)
        }
        .padding(.leading, 12)
    }
}
