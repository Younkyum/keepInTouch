//
//  SwiftUIView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/27/24.
//

import SwiftUI
import Contacts

struct RegisterNotificationView: View {
    @State var title: String = ""
    @State var memo: String = ""
    var cycleOptions = ["1주", "2주", "1개월", "2개월", "6개월"]
    @State var selectedCycle = ""
    @State var targetContact: CNContact?
    
    
    @Binding var showRegisterNotificationView: Bool
    @State var isChanged = false
    @State var showSaveActionSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("연락처 알림 정보") {
                        TextField("예) 전화 하기", text: $title)
                            .onChange(of: title) { oldValue, newValue in
                                isChangedSomething()
                            }
                        TextField("추가 메모", text: $memo, axis: .vertical)
                            .lineLimit(3...10)
                            .onChange(of: memo) { oldValue, newValue in
                                isChangedSomething()
                            }
                    }
                    
                    Section {
                        Picker("알림 반복 기간 설정", selection: $selectedCycle) {
                            ForEach(cycleOptions, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    Section {
                        NavigationLink(destination: SelectContactView(targetContact: $targetContact)) {
                            Text("연락처 선택")
                        }
                    }
                    
                }
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
                        .disabled(!isChanged || targetContact == nil)
                        
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
        print("저장됨")
    }
    
    func isChangedSomething() {
        if (title != "") {
            isChanged = true
        } else {
            isChanged = false
        }
    }
}

//#Preview {
//    RegisterNotificationView()
//}
