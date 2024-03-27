//
//  NotiContactsRow.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/26/24.
//

import SwiftUI


struct NotiContactsRow: View {
    @State var notiTitle: String = "전화 걸기"
    @State var notiTargetName: String = "Younkyum Jin"
    @State var notiTargetOrganizationName: String = "Team Shaka"
    @State var notiDate = "2024-03-08"
    
    var body: some View {
        HStack(alignment: .center){
            Image("thumbnail")
                .resizable()
                .frame(width: 58, height: 58)
                .clipShape(Circle())
            
            VStack(alignment: .leading, content: {
                Text(notiTitle)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.bottom, 1)
                Text("\(notiTargetName) | \(notiTargetOrganizationName)")
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .font(.system(size: 16))
                    .foregroundStyle(.textGray)
            })
            
            Spacer()
            
            makeRelativeTimeIndicator()
            
        }
        .background(.backgroundWhite)
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            Button(action: {
                print("체크 표시")
            }, label: {
                Label("완료로 표시", systemImage: "checkmark")
                    .tint(.textBlue)
            })
        }
    }
}



#Preview(body: {
    NotiContactsRow()
})


extension NotiContactsRow {
    func makeRelativeTimeIndicator() -> RelativeDateIndicator {
        switch relativeDateFromToday(date: notiDate) {
        case ...(-1):
            return RelativeDateIndicator(notiDate: notiDate, backgroundColor: .backgroundRed, foreGroundColor: .textRed)
        case 1...:
            return RelativeDateIndicator(notiDate: notiDate, backgroundColor: .backgroundBlue, foreGroundColor: .textBlue)
        default:
            return RelativeDateIndicator(notiDate: notiDate, backgroundColor: .backgroundGreen, foreGroundColor: .textGreen)
            
        }
    }
}


struct RelativeDateIndicator: View {
    @State var notiDate: String
    @State var backgroundColor: Color
    @State var foreGroundColor: Color
    
    var body: some View {
        ZStack {
            Text(getRelativeDateString(date: notiDate))
                .font(.system(size: 14))
                .foregroundStyle(foreGroundColor)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(backgroundColor)
        .clipShape(Capsule())
    }
}

