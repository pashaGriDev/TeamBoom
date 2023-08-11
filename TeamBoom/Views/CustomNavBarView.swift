//
//  CustomNavBarView.swift
//  TeamBoom
//
//  Created by Павел Грицков on 11.08.23.
//

import SwiftUI

struct CustomNavBarView: View {
    @State private var title: String = "Main Title" //""
    @State private var showBackButton = true
    
    var body: some View {
        HStack {
            if showBackButton {
                Button {
                    // do something
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            Text(title)
                .font(.title)

            Spacer()
        }
        .padding()
        .foregroundColor(.black)
        .background(.blue)
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView()
            Spacer()
        }
    }
}
