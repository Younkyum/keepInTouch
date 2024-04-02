//
//  ContactCellView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/19/24.
//

import SwiftUI
import Contacts

struct RegisteredListRow: View {
    @State public var notificationData: RegisteredNotification
    
    var body: some View {
        HStack{
            Image(uiImage: (UIImage(data: notificationData.thumbNailData ?? Data()) ?? UIImage(named: "thumbnail")!))
                .resizable()
                .frame(width: 58 , height: 58)
                .cornerRadius(29)
                .padding(.trailing, 5)
            VStack(alignment: .leading, spacing: 4, content: {
                Text("\(notificationData.title)")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.textBlack)
                HStack {
                    Text("\(notificationData.targetName)")
                        .font(.system(size: 16))
                        .foregroundStyle(.textGray)
                    Divider()
                    Text("\(notificationData.cycle)")
                        .font(.system(size: 16))
                        .foregroundStyle(.textGray)
                }
                .frame(height: 20)
            })
            Spacer()
            
        }
        .background(.backgroundWhite)
        .listRowBackground(Color.clear)
    }
}
