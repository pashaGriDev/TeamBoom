//
//  ContentView.swift
//  TeamBoom
//
//  Created by Павел Грицков on 07.08.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("textBomb")
            Image("bomb")
            Text("TeamBoom")
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(.violet)
                .padding()
                .background(.yellowOfButton)
                .padding()
                .background(.orangeGradient)
                .padding()
                .background(.yellowGradient)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
