//
//  HomeView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/8/24.
//

import SwiftUI
import Contacts

let lateNoti = [
    testData(notiDate: "2024-3-20", notiTitle: "연락 하기"),
    testData(notiDate: "2024-3-21", notiTitle: "문자 보내기")
]
let todayNoti = [
    testData(notiDate: "2024-3-27", notiTitle: "연락 하기"),
    testData(notiDate: "2024-3-27", notiTitle: "문자 보내기"),
    testData(notiDate: "2024-3-27", notiTitle: "연락 하기"),
    testData(notiDate: "2024-3-27", notiTitle: "문자 보내기")
]
let futureNoti = [
    testData(notiDate: "2024-4-1", notiTitle: "연락 하기"),
    testData(notiDate: "2024-3-31", notiTitle: "문자 보내기")
]

struct HomeView: View {
    @State var sectionHead = ["이미 늦은 연락", "오늘 진행해야 하는 연락", "곧 다가오는 연락"]
    @State var footerHead = [lateNoti, todayNoti, futureNoti]
    
    @State var showSelectContactView = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment: .leading, content: {
                    List{
                        ForEach(footerHead.indices) { index in
                            Section {
                                ForEach(footerHead[index], id: \.self) { data in
                                    HomeNotificationContactRow(notiTitle: data.notiTitle, notiTargetName: data.notiTargetName, notiTargetOrganizationName: data.notiTargetOrganization, notiDate: data.notiDate)
                                }
                                .onDelete { footerHead[index].remove(atOffsets: $0) }
                            } header: {
                                Text(sectionHead[index])
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                    .foregroundStyle(.backgroundBlack)
                    .scrollContentBackground(.hidden)
                    .background(.backgroundWhite)
                    .listRowSeparator(.hidden, edges: .all)
                    
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarTrailing, content: {
                            NavigationLink(destination: SeeReigsteredNotificationView()) {
                                Image("Lists")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        })
                        ToolbarItem(placement: .topBarLeading) {
                            EditButton()
                                .tint(.textBlack)
                        }
                    })
                    
                    
                })
                .background(.backgroundWhite)
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        BottomTrailingButton(status: $showSelectContactView)
                    }
                }
            }
            .background(.backgroundWhite)
        }
        .background(.backgroundWhite)
        .sheet(isPresented: $showSelectContactView) {
            SelectContactView(showSelectContactView: $showSelectContactView)
        }
    }
}


struct testData: Hashable {
    var notiDate: String
    var notiTitle: String
    var notiTargetName = "Younkyum JIN"
    var notiTargetOrganization = "Team Shaka"
}


