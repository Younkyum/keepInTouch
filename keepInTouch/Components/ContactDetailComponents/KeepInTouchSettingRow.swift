//
//  KeepInTouchSettingRow.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI


struct KeepInTouchSettingRow: View {
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
