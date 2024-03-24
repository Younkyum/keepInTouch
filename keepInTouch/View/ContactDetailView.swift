//
//  ContactDetailView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/9/24.
//

import SwiftUI
import Contacts

struct ContactDetailView: View {
    @State var contactData: CNContact
    @State var isChanged: Bool = false
    @State var isAlertNessecary: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0, content: {
                ProfileRow(contactData: contactData)
                
                KeepInTouchSettingRow()
                
                ContactDataRow(type: "전화번호",
                               contactData: contactData,
                               value: "\(contactData.phoneNumbers.first?.value.stringValue ?? "")",
                               isChanged: $isChanged)
                
                ContactDataRow(type: "이메일",
                               contactData: contactData,
                               value: "\(contactData.emailAddresses.first?.value ?? "")",
                               isChanged: $isChanged)
                
            })
        }
        .background(.backgroundWhite)
        .scrollIndicators(.never)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    print("edit")
                }, label: {
                    Text("편집")
                        .font(.system(size: 18))
                        .foregroundStyle(.textBlack)
                    
                })
            }
        }
    }
}

