//
//  MainView.swift
//  swiftUIChatter
//
//  Created by 李子恒 on 07-07-2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var store = ChattStore.shared

    @State private var isPresenting = false
    
    var body: some View {
        NavigationView {
            List(store.chatts.indices, id: \.self) {
                ChattListRow(chatt: store.chatts[$0])
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(($0 % 2 == 0) ? .systemGray5 : .systemGray6))
            }
            .listStyle(.plain)
            .refreshable {
                store.getChatts()
            }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Chatter")
                    }
                    ToolbarItem(placement:.navigationBarTrailing) {
                        Button(action: { isPresenting.toggle() }) {
                            Image(systemName: "square.and.pencil")
                        }.sheet(isPresented: $isPresenting) {
                            PostView(isPresented: $isPresenting)
                        }
                    }
                }
        }
        
        
        
    }
}

#Preview {
    MainView()
}
