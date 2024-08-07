//
//  ChattListRow.swift
//  swiftUIChatter
//
//  Created by 李子恒 on 07-07-2024.
//

import SwiftUI

struct ChattListRow: View {
    var chatt: Chatt
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let username = chatt.username, let timestamp = chatt.timestamp {
                    Text(username).padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)).font(.system(size: 14))
                    Spacer()
                    Text(timestamp).padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0)).font(.system(size: 14))
                }
            }
            if let message = chatt.message {
                Text(message).padding(EdgeInsets(top: 8, leading: 0, bottom: 6, trailing: 0))
            }
        }
    }
}
