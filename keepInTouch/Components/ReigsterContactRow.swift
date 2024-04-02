//
//  ContactCellView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/19/24.
//

import SwiftUI
import Contacts

struct ReigsterContactRow: View {
    @State public var contactData: CNContact
    
    var body: some View {
        HStack{
            Image(uiImage: (UIImage(data: contactData.thumbnailImageData ?? Data()) ?? UIImage(named: "thumbnail")!))
                .resizable()
                .frame(width: 58 , height: 58)
                .cornerRadius(29)
                .padding(.trailing, 5)
            VStack(alignment: .leading, spacing: 4, content: {
                Text("\(contactData.familyName)\(contactData.givenName)")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundStyle(.textBlack)
                
                if contactData.organizationName != "" {
                    Text(contactData.organizationName)
                        .font(.system(size: 16))
                        .foregroundStyle(.textGray)
                    
                }
            })
            Spacer()
        }
        
    }
}
