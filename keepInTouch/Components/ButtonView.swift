//
//  ButtonView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/19/24.
//

import SwiftUI

struct ButtonsView: View {
    @Binding var isChanged: Bool
    var body: some View {
        HStack(content: {
            Spacer()
            ZStack {
                Button(action: {
                    print("저장 버튼 눌림")
                    // 변경사항 저장 필요
                    isChanged = false
                }, label: {
                    HStack{
                        Image("Check")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("저장 하기")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(.textWhite)
                    }
                })
                .padding([.leading, .trailing], 22)
                .padding([.top, .bottom], 12)
            }
            .background(.backgroundBlack)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        })
        .padding(.trailing, 16)
    }
}

