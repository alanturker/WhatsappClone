//
//  CallsTabScreen.swift
//  WhatsAppClone
//
//  Created by Turker Alan on 15.10.2025.
//

import SwiftUI


struct CallsTabScreen: View {
    @State private var searchText = ""
    @State private var callHistory = CallHistory.all
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    FavoriteItemView()
                        .listRowBackground(Color.clear)
                } header: {
                    Text("Favorites")
                        .font(.headline)
                        .foregroundStyle(Color.whatsAppBlack)
                        .bold()
                }
                .listRowSeparator(.hidden)
                
                
                Section {
                    RecentCallsListView()
                        .listRowBackground(Color.clear)
                } header: {
                    Text("Recent")
                        .font(.headline)
                        .foregroundStyle(Color.whatsAppBlack)
                        .bold()
                }
                .listRowSeparator(.hidden)
                
                callsFooterView()
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                
            }
            .listStyle(.grouped)
            .navigationTitle("Calls")
            .searchable(text: $searchText)
            .toolbar {
                leadingNavBarItem()
                trailingNavBarItem()
                principalNavBarItem()
            }
        }
    }
    
    private func callsFooterView() -> some View {
        HStack {
            Image(systemName: "lock.fill")
            (
                Text("Your personal calls are ")
                
                +
                
                Text("end-to-end encrypted")
                    .foregroundStyle(Color.green)
                    .bold()
            )
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .foregroundStyle(Color.gray)
        .font(.caption)
        .padding(.horizontal)
    }
}

extension CallsTabScreen {
    enum Constant {
        static let imageDimensions: CGFloat = 40
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
            Button {
                print("toolbar trailing item tapped")
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
    
    // ex version principal picker
    @ToolbarContentBuilder
    private func principalNavBarItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("", selection: $callHistory) {
                ForEach(CallHistory.allCases, id: \.id) { item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
            .onChange(of: callHistory) {
                print("Selected: \(callHistory.id)")
            }
        }
    }
    
    private enum CallHistory: String, CaseIterable, Identifiable {
        case all, missed
        
        var id: String {
            return rawValue
        }
    }
}
private struct FavoriteItemView: View {
    var body: some View {
        HStack {
            Button {
                print("Add to Favorites")
            } label: {
                Image(systemName: "plus")
                    .padding(8)
                    .background(
                        Circle()
                            .foregroundStyle(.gray.opacity(0.2))
                    )
            }
            
            Text("Add favorite")
            
        }
    }
}
private struct RecentCallsListView: View {
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(0..<20) { int in
                RecentCallsRowView(title: int)
                Divider()
            }
        }
    }
}

private struct RecentCallsRowView: View {
    enum State: String {
        case missed = "Missed"
        case incoming = "Incoming"
        case outgoing = "Outgoing"
        
        var title: String {
            return self.rawValue
        }
        
        var image: String {
            switch self {
            case .missed:
                return "phone.arrow.down.left"
            case .incoming:
                return "arrow.down.left.video.fill"
            case .outgoing:
                return "phone.arrow.up.right"
            }
        }
    }
    
    var title: Int
    
    var state: State {
        if title % 3 == 0 {
            return .missed
        } else if title % 2 == 0 {
            return .incoming
        } else {
            return .outgoing
        }
    }
    
    var body: some View {
        HStack(alignment: .center){
            Circle()
                .frame(width: CallsTabScreen.Constant.imageDimensions,
                       height: CallsTabScreen.Constant.imageDimensions)
            VStack(alignment: .leading) {
                Text("Recent Person \(title)")
                    .font(.body)
                    .foregroundStyle( state == .missed ? .red : Color.whatsAppBlack)
                HStack {
                    Image(systemName: state.image)
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    Text(state.title)
                        .font(.caption)
                }
            }
            
            Spacer()
            
            Text("\(title + 1).05.2022")
                .font(.callout)
                .foregroundStyle(.gray)
            
            Button {
                print("info Button tapped \(title)")
            } label: {
                Image(systemName: "info.circle")
                    .font(.body)
                    .fontWeight(.light)
            }
            .buttonStyle(PlainButtonStyle())
            .contentShape(Rectangle())
            
        }
        .padding(.horizontal, 6)
    }
}

//#Preview {
//    CallsTabScreen()
//}
