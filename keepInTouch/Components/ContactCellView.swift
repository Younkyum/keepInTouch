//
//  ContactCellView.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/19/24.
//

import SwiftUI
import Contacts

struct ContactCellView: View {
    @State public var contactData: CNContact
    @State private var showDetailModal = false
    
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
        .onTapGesture {
            showDetailModal = true
        }
        .background(.backgroundWhite)
        .sheet(isPresented: self.$showDetailModal, content: {
            ContactDetailView(contactDetail: contactData)
        })
    }
}
