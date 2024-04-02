//
//  SwiftUIView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/27/24.
//

import SwiftUI
import Contacts

struct RegisterNotificationView: View {
    @Environment(\.modelContext) private var context
    @State var title: String = ""
    @State var memo: String = ""
    var cycleOptions: [NotiCycle] = [.oneWeek, .twoWeeks, .oneMonth, .twoMonths, .sixMonths]
    @State var selectedCycle = NotiCycle.oneWeek
    @State var targetContact: CNContact
    
    
    @Binding var showRegisterNotificationView: Bool
    @Binding var showSelectContactView: Bool
    @State var isChanged = false
    @State var showSaveActionSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ContactDataRow(contactData: targetContact)
                    
                    Section("알림 정보") {
                        TextField("알림 제목(필수)", text: $title)
                            .onChange(of: title) { oldValue, newValue in
                                isChangedSomething()
                            }
//                        TextField("추가 메모", text: $memo, axis: .vertical)
//                            .lineLimit(3...10)
//                            .onChange(of: memo) { oldValue, newValue in
//                                isChangedSomething()
//                            }
                    }
                    
                    Section {
                        Picker("알림 반복 기간 설정", selection: $selectedCycle) {
                            ForEach(cycleOptions, id: \.self) { cycle in
                                Text(cycle.rawValue)
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .toolbarTitleDisplayMode(.inline)
                .navigationBarTitle("새로운 연락처 알림", displayMode: .inline)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("취소") {
                            if isChanged {
                                showSaveActionSheet = true
                            } else {
                                showRegisterNotificationView = false
                            }
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("완료") {
                            saveNotification()
                        }
                        .disabled(!isChanged)
                        
                    }
                })
                .toolbar(.visible, for: .navigationBar)
                .confirmationDialog("", isPresented: $showSaveActionSheet, titleVisibility: .hidden) {
                    Button("변경 사항 폐기", role: .destructive) {
                        showRegisterNotificationView = false
                    }
                }
            }
        }
    }
}


extension RegisterNotificationView {
    func saveNotification() {
        
        var registerNoti = RegisteredNotification(targetName: "\(targetContact.familyName) \(targetContact.givenName)",
                                                  targetOrganization: targetContact.organizationName,
                                                  targetPhoneNumber: targetContact.phoneNumbers.first?.value.stringValue ?? "전화번호 없음",
                                                  targetEmailAdress: (targetContact.emailAddresses.first?.value ?? "이메일 없음") as String,
                                                  thumbNailData: targetContact.thumbnailImageData ?? Data(),
                                                  cycle: selectedCycle.rawValue,
                                                  title: title)
        
        context.insert(registerNoti)
        
        let result: ()? = try? context.save()
        
        showSelectContactView = false
        showRegisterNotificationView = false
    }
    
    func isChangedSomething() {
        if (title != "") {
            isChanged = true
        } else {
            isChanged = false
        }
    }
}

