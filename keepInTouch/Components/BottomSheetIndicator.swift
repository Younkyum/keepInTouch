//
//  BottomSheetIndicator.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI

struct BottomSheetIndicator: View {
    var body: some View {
        HStack(alignment: .center, content: {
            Spacer()
            Capsule()
                .fill(.textGray)
                .frame(width: 34, height: 5)
            Spacer()
        })
        .padding(.top, 5)
        .frame(height: 10)
        .background(.backgroundWhite)
    }
}
