//
//  ComponentView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI
import Contacts


struct ContactDataRow: View {
    let type: String
    @State var contactData: CNContact
    @State var value: String
    @Binding var isChanged: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content:{
            Text(type)
                .font(.system(size: 16))
                .foregroundStyle(.textGray)
            
            switch type {
            case "전화번호":
                TextField(type, text: $value, onEditingChanged: { getChanged in
                    if (contactData.phoneNumbers.first?.value.stringValue ?? "" != value) {
                        isChanged = true
                    }
                })
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.textBlack)
                    .keyboardType(.phonePad)
                    .onAppear(perform: UIApplication.shared.hideKeyboard)
                    .autocorrectionDisabled()
            case "이메일":
                TextField(type, text: $value, onEditingChanged: { getChanged in
                    if ((contactData.emailAddresses.first?.value ?? "") as String != value) {
                        isChanged = true
                    }
                })
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.textBlack)
                    .keyboardType(.emailAddress)
                    .onAppear(perform: UIApplication.shared.hideKeyboard)
                    .autocorrectionDisabled()
            default:
                TextField(type, text: $value)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.textBlack)
                    .onAppear(perform: UIApplication.shared.hideKeyboard)
            }
            
        })
        .padding(16)
    }
}



