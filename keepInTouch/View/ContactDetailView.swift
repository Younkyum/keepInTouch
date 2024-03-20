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
    
    var body: some View {
        HStack(alignment: .center, content: {
            Spacer()
            Capsule()
                .fill(.textGray)
                .frame(width: 34, height: 5)
            Spacer()
        })
        .padding(.top, 5)
        ScrollView{
            VStack(alignment: .leading, spacing: 0, content: {
                ProfileView(contactData: contactData)
                KeepInTouchSettingView()
                if isPhoneNumberThere() {
                    ComponetView(type: "전화번호", value: "\(contactData.phoneNumbers.first?.value.stringValue ?? "")")
                }
                if isEmailThere() {
                    ComponetView(type: "이메일", value: "\(contactData.emailAddresses.first?.value ?? "")")
                }
//                if isNoteThere() {
//                    ComponetView(type: "메모(추후 제거될 예정)", value: "\(contactData.note)")
//                }
                ButtonsView()
            })
        }
        .scrollIndicators(.never)
    }
}


// MARK: - ProfileView
struct ProfileView: View {
    @State var contactData: CNContact
    var body: some View {
        HStack {
            Image(uiImage: (UIImage(data: contactData.thumbnailImageData ?? Data()) ?? UIImage(named: "thumbnail")!))
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(61)
                .padding(10)
            VStack(alignment: .leading, spacing: 7, content: {
                Text("\(contactData.familyName)\(contactData.givenName)")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.textBlack)
                if contactData.organizationName != "" {
                    Text("\(contactData.organizationName)")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.textGray)
                }
            })
            Spacer()
        }
        .frame(maxHeight: 122)
        .padding(16)
    }
}


// MARK: - KeepInTouchSettingView
struct KeepInTouchSettingView: View {
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 1, content: {
                    Text("keep in touch")
                        .font(.system(size: 20))
                    Text("연락 기간 설정")
                        .font(.system(size: 12))
                        .foregroundStyle(.textGray)
                })
                Spacer()
                HStack(alignment: .center, spacing: 0, content: {
                    Text("2주")
                        .font(.system(size: 20))
                    Image("Sort")
                        .resizable()
                        .frame(width: 24,height: 24)
                })
            }
            .padding(16)
            .background(.backgroundGray)
            .cornerRadius(10)
        }
        .padding(16)
        
    }
}


// MARK: - ComponentView
struct ComponetView: View {
    let type: String
    @State var value: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content:{
            Text(type)
                .font(.system(size: 16))
                .foregroundStyle(.textGray)
            Text(value)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(.textBlack)
        }).padding(16)
    }
}



