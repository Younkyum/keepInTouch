//
//  ButtonView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/19/24.
//

import SwiftUI

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
