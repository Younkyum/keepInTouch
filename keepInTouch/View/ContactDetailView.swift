//
//  ContactDetailView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/9/24.
//

import SwiftUI

struct ContactDetailView: View {
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
                ProfileView()
                KeepInTouchSettingView()
                ComponetView()
                ComponetView()
                ComponetView()
                ComponetView()
                ComponetView()
                ComponetView()
                ButtonsView()
            })
        }
        .scrollIndicators(.never)
    }
}

#Preview {
    ContactDetailView()
}

struct ProfileView: View {
    var body: some View {
        HStack {
            Image("ProfileImage")
                .resizable()
                .frame(width: 122, height: 122)
                .cornerRadius(61)
            VStack(alignment: .leading, spacing: 7, content: {
                Text("Younkyum Jin")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.textBlack)
                Text("Team Shaka")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.textGray)
            })
            Spacer()
        }
        .frame(maxHeight: 122)
        .padding(16)
    }
}

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


struct ComponetView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content:{
            Text("전화번호")
                .font(.system(size: 16))
                .foregroundStyle(.textGray)
            Text("010-9186-5287")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.textBlack)
        }).padding(16)
    }
}


struct ButtonsView: View {
    var body: some View {
        HStack(content: {
            Spacer()
            ZStack {
                Button(action: {
                    print("정보 추가하기 버튼 눌림")
                }, label: {
                    Text("정보 추가하기")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.textWhite)
                })
                .padding([.top, .bottom], 13)
                .padding([.leading, .trailing], 22)
            }
            .background(.backgroundBlack)
            .clipShape(Capsule())
        })
        .padding(.trailing, 16)
    }
}
