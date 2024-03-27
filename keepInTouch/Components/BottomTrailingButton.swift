//
//  BottomTrailingButton.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/26/24.
//

import SwiftUI

struct BottomTrailingButton: View {
    @State var titleText: String = "새로운 연락처 추가하기"
    @Binding var status: Bool
    
    var body: some View {
        Button(action: {
            status = true
        }, label: {
            HStack {
                Image("PlusMark")
                    .resizable()
                    .frame(width: 18, height: 18)
                Text(titleText)
                    .font(.system(size: 18))
                    .foregroundStyle(.textWhite)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 20)
            .background(.backgroundBlack)
            .clipShape(Capsule())
            
            
        })
        .shadow(radius: 5)
        .padding([.trailing, .bottom])
    }
}

