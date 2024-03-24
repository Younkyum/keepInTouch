//
//  ContactSectionRow.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI

// MARK: - CustomHeaderCellView
struct ContactSectionRow: View {
    var body: some View {
        HStack{
            Text("헤더입니다.")
                .font(.system(size: 14))
                .fontWeight(.light)
                .foregroundStyle(.gray)
            Spacer()
        }
        .frame(maxHeight: 35)
        .background(.backgroundWhite)
    }
}

