//
//  ProfileRow.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/24/24.
//

import SwiftUI
import Contacts


struct ProfileRow: View {
    @State var contactData: CNContact
    var body: some View {
        HStack {
            Image(uiImage: (UIImage(data: contactData.thumbnailImageData ?? Data()) ?? UIImage(named: "thumbnail")!))
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(61)
                .padding(10)
            VStack(alignment: .leading, spacing: 7, content: {
                Text("\(contactData.familyName)\(contactData.givenName)")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.textBlack)
                if contactData.organizationName != "" {
                    Text("\(contactData.organizationName)")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.textGray)
                }
            })
            Spacer()
        }
        .frame(maxHeight: 122)
        .padding(16)
    }
}
