//
//  UpdatesTabScreen.swift
//  WhatsAppClone
//
//  Created by Turker Alan on 13.10.2025.
//

import SwiftUI

struct UpdatesTabScreen: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    StatusSectionHeader()
                    
                    StatusSection()
                } header: {
                    Text("Status")
                        .font(.headline)
                        .foregroundStyle(Color.whatsAppBlack)
                        .bold()
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
                Section {
                    RecentUpdatesItemView()
                } header: {
                    Text("Recent updates")
                        .bold()
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
                Section {
                    ChannelListHeaderView()
                    ChannelListView()
                    ChannelButton(title: "Explore more", icon: "square.grid.2x2")
                    ChannelButton(title: "Create channel", icon: "plus")
                } header: {
                    Text("Channels")
                        .foregroundStyle(Color.whatsAppBlack)
                        .bold()
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
            }
            .listStyle(.grouped)
            .navigationTitle("Updates")
            .searchable(text: $searchText)
            .toolbar {
                leadingNavBarItem()
            }
        }
    }
}

extension UpdatesTabScreen {
    enum Constant {
        static let imageDimensions: CGFloat = 55
    }
    
    @ToolbarContentBuilder
    private func leadingNavBarItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                print("toolbar leading item tapped")
            } label: {
                Image(systemName: "ellipsis")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.whatsAppBlack)
                    .padding(10)
                    .background(
                        Circle()
                            .foregroundStyle(.gray.opacity(0.2))
                    )
            }
            
        }
    }
}

private struct StatusSectionHeader: View {
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "circle.dashed")
                .foregroundStyle(.blue)
                .imageScale(.large)
            (
                Text("Use Status to share photos, text and videos that disappear after 24 hours")
                +
                Text("")
                +
                Text("Status Privacy")
                    .foregroundStyle(.blue).bold()
            )
            
            Image(systemName: "xmark")
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color.whatsAppWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

private struct StatusSection: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: UpdatesTabScreen.Constant.imageDimensions, height: UpdatesTabScreen.Constant.imageDimensions)
            
            VStack(alignment: .leading) {
                Text("My Status")
                    .font(.callout)
                    .bold()
                
                Text("1h ago")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            cameraButton()
            pencilButton()
            
        }
    }
    
    private func cameraButton() -> some View {
        Button {
            print("camera button tapped")
        } label: {
            Image(systemName: "camera.fill")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold()
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())

    }
    
    private func pencilButton() -> some View {
        Button {
            print("edit button tapped")
        } label: {
            Image(systemName: "pencil")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold()
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())

    }
}

private struct RecentUpdatesItemView: View {
    var body: some View {
        HStack {
            
            Circle()
                .frame(width: UpdatesTabScreen.Constant.imageDimensions, height: UpdatesTabScreen.Constant.imageDimensions)
            
            VStack(alignment: .leading) {
                Text("Joseph Smith")
                    .font(.callout)
                    .bold()
                
                Text("Add to my status")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
        }
    }
}

private struct ChannelListHeaderView: View {
    var body: some View {
        Text("Stay updated topics that matter to you. Find channels to follow below.")
            .foregroundStyle(.gray)
            .font(.callout)
            .padding(.horizontal)
    }
}

private struct ChannelListView: View {
    static let bimChannel = ChannelModel(rawValue: 0, followerCount: "5.7M", name: "BİM Türkiye")
    static let gsChannel = ChannelModel(rawValue: 1, followerCount: "4.1M", name: "Galatasaray")
    static let a101Channel = ChannelModel(rawValue: 2, followerCount: "4.3M", name: "A101iletişim")
    
    static let items : [ChannelModel] = [ChannelListView.bimChannel, ChannelListView.gsChannel, ChannelListView.a101Channel]
    
    @State var isExpanded: Bool = false
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            VStack {
                ForEach(ChannelListView.items, id: \.id) { item in
                    ChannelItemView(followerCount: item.followerCount, title: item.name) {
                        print(item.name)
                    }
                }
                
            }
        } label: {
            HStack {
                Text("Find channels to follow")
            }
        }
        .padding(.horizontal)
    }
}

private struct ChannelItemView: View {
    var followerCount: String
    var title: String
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: UpdatesTabScreen.Constant.imageDimensions, height: UpdatesTabScreen.Constant.imageDimensions)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    
                    Text("\(followerCount) followers")
                        .font(.callout)
                        .foregroundStyle(.gray)
                    
                }
                
                Spacer()
                
                Button {
                    onTap()
                } label: {
                    Text("Follow")
                        .bold()
                        .font(.caption)
                        .foregroundStyle(Color.whatsAppBlack.opacity(0.7))
                        .padding(8)
                        .padding(.horizontal, 10)
                        .background(Color.bubbleGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                .buttonStyle(PlainButtonStyle())
                .contentShape(Rectangle())
            }
            
            Divider()
        }
        
    }
}

private struct ChannelButton: View {
    var title: String
    var icon: String
    
    var body: some View {
        Button {
            print(title)
        } label: {
            HStack {
                Image(systemName: icon)
                    
                Text(title)
                 
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
            )
        }
        .frame(maxWidth: .infinity)
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())

    }
}

private struct ChannelModel: Identifiable {
    var id: Int { self.rawValue }
    var rawValue: Int
    var followerCount: String
    var name: String
    var items: [ChannelModel]?
}

#Preview {
    UpdatesTabScreen()
}
