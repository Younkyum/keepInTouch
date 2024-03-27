//
//  TitleBarRow.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI
import Contacts


struct TitleBarRow: View {
    var body: some View {
        HStack{
            Image("Logo")
                .resizable()
                .frame(width: 140, height: 20)
            Spacer()
            HStack{
                Button(action: {
                    print("List Button Pushed")
                }, label: {
                    Image("Lists")
                        .resizable()
                        .frame(width: 24, height: 24)
                })
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxHeight: 44)
    }
}



#Preview {
    TitleBarRow()
}

