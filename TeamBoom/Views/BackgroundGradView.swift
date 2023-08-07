//
//  BackgroundGradView.swift
//  TeamBoom
//
//  Created by Artem on 07.08.2023.
//

import SwiftUI

struct BackgroundGradientView: View {
  
    var body: some View {
        
        LinearGradient(colors: [.yellowGradient, .orangeGradient], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct BackgroundGradientView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientView()
    }
}
