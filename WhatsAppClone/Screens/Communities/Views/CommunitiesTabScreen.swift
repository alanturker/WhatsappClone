//
//  CommunitiesTabScreen.swift
//  WhatsAppClone
//
//  Created by Turker Alan on 15.10.2025.
//

import SwiftUI

struct CommunitiesTabScreen: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Image(.communities)
                        .resizable()
                    
                    Group {
                        Text("Stay connected with a community")
                            .font(.title2)
                        
                        Text("Communities bring members together in topic-based groups. Any community you're added to will appear here")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 5)
                        
                    exampleButton()
                        .frame(maxWidth: .infinity,
                               alignment: .center)
                        .padding(.top, 5)
                    
                    createNewCommunityButton()
                        .padding(.top, 10)
                }
                .padding()
                .navigationTitle("Communities")
                .toolbar {
                    trailingNavBarItem()
                }
            }
        }
    }
    
    private func exampleButton() -> some View {
        Button {
            print("example communities button tapped")
        } label: {
            Label("See example communities", systemImage: "chevron.right")
                .foregroundStyle(.green)
                .environment(\.layoutDirection, .rightToLeft)
        }

    }
    
    private func createNewCommunityButton() -> some View {
        Button {
            print("create new community button tapped")
        } label: {
            Label("New community", systemImage: "plus")
                .bold()
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundStyle(Color.white)
                .padding(12)
                .background(.green)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        }
    }
}

extension CommunitiesTabScreen {
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
}
