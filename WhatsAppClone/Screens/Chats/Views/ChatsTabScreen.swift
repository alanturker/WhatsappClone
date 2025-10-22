//
//  ChatsTabScreen.swift
//  WhatsAppClone
//
//  Created by Turker Alan on 16.10.2025.
//

import SwiftUI

struct ChatsTabScreen: View {
    @State private var searchText = ""
    @State private var selectedFilter = ChatFilter.all
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ChatFilterView(selectedFilter: $selectedFilter)
                ChatsListView()
            }
            .navigationTitle("Chats")
            .searchable(text: $searchText)
            .toolbar {
                leadingNavBarItem()
                trailingNavBarItem()
            }
        }
    }
}

extension ChatsTabScreen {
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
    
    @ToolbarContentBuilder
    private func trailingNavBarItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 4) {
                Button {
                    print("toolbar trailing Camera item tapped")
                } label: {
                    Image(systemName: "camera.fill")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.whatsAppBlack)
                        .padding(6)
                        .background(
                            Circle()
                                .foregroundStyle(Color.gray.opacity(0.2))
                        )
                }
                
                Button {
                    print("toolbar trailing Plus item tapped")
                } label: {
                    Image(systemName: "plus")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.whatsAppWhite)
                        .padding(6)
                        .background(
                            Circle()
                                .foregroundStyle(Color.green)
                        )
                }
            }
        }
    }
}

enum ChatFilter: String, CaseIterable, Identifiable {
    case all
    case unread
    case favorites
    case groups
    case plus
    
    var id: String { rawValue }
}

private struct ChatFilterView: View {
    @Binding var selectedFilter: ChatFilter
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(ChatFilter.allCases, id: \.id) { filter in
                    let isSelected = (filter == selectedFilter)
                    chatFilterItem(for: filter, isSelected: isSelected)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
        }
    }
    
    private func chatFilterItem(for filter: ChatFilter, isSelected: Bool) -> some View {
        Button {
            print("Tap on \(filter.id)")
            selectedFilter = filter
        } label: {
            if filter == .plus {
                Image(systemName: "plus")
                    .chatFilterButtonModifier(isSelected: isSelected)
            } else {
                Text(filter.id.capitalized)
                    .chatFilterButtonModifier(isSelected: isSelected)
            }
        }
    }
}

private struct ChatsListView: View {
    
    var body: some View {
        LazyVStack {
            ForEach(0..<20) { item in
                chatListItem(name: "Chat Name \(item)", message: "Message \(item)", numb: String(item + 10))
                Divider()
                    .padding(.leading, 40)
            }
            .padding(.horizontal)
        }
    }
    
    private func chatListItem(name: String, message: String, numb: String) -> some View {
        HStack(alignment: .top) {
            Circle()
                .frame(width: ChatsTabScreen.Constant.imageDimensions,
                       height: ChatsTabScreen.Constant.imageDimensions)
            
            VStack {
                Text(name)
                    .font(.callout)
                    .bold()
                Text(message)
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            Text("14.\(numb)")
                .foregroundStyle(.gray)
                .font(.system(size: 15))
        
        }
    }
}

