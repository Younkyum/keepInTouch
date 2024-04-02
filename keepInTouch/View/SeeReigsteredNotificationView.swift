//
//  SeeReigsteredNotificationView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 4/2/24.
//

import SwiftUI
import SwiftData

struct SeeReigsteredNotificationView: View {
    @Environment(\.modelContext) private var context
    
    @Query var registeredNotificationList: [RegisteredNotification]

    
    var body: some View {
        VStack {
            List {
                ForEach(registeredNotificationList, id: \.id) { notification in
                    RegisteredListRow(notificationData: notification)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let notification = registeredNotificationList[index]
                        context.delete(notification)
                        try? context.save()
                    }
                })
                .background(.backgroundWhite)
            }
            .navigationTitle("등록된 알림 목록")
            .toolbar(content: {
                EditButton()
            })
            .listStyle(.plain)
            .foregroundStyle(.backgroundBlack)
            .scrollContentBackground(.hidden)
            .background(.backgroundWhite)
            .listRowSeparator(.hidden, edges: .all)
        }
    }
}

