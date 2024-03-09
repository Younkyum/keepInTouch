//
//  ContactDetailView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/9/24.
//

import SwiftUI

struct ContactDetailView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            ProfileView()
            KeepInTouchSettingView()
            ComponetView()
            ComponetView()
            ComponetView()
            ComponetView()
            ComponetView()
            ComponetView()
        })
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
                Text("Team Shaka")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.gray)
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
                        .foregroundStyle(.gray)
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
            .background(Color(hex:"F9F9F9"))
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
                .foregroundStyle(.gray)
            Text("010-9186-5287")
                .font(.system(size: 20, weight: .semibold))
        }).padding(16)
    }
}
