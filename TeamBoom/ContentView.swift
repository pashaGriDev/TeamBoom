//
//  ContentView.swift
//  TeamBoom
//
//  Created by Павел Грицков on 07.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundGradientView()
                .ignoresSafeArea()
            VStack {
                Image("textBomb")
                Image("bomb")
                Text("TeamBoom")
                    .modifier(ButtonViewModifier())
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
