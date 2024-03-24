//
//  BackButton.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("BackArrow")
                .resizable()
                .frame(width: 24, height: 24)
        })
    }
}

#Preview {
    BackButton()
}
