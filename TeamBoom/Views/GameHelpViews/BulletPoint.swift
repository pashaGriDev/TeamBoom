//
//  BulletPoint.swift
//  TeamBoom
//
//  Created by Андрей Бородкин on 12.08.2023.
//

import SwiftUI

struct BulletPoint: View {

    var fontSize: CGFloat = 18

    var bullet: String?

    var contents: String {
        if let text = bullet {
            return text
        } else {
            return ""

        }
    }
    var descriptiveBulletPoint: Bool {
        if let bullet {
            return true
        } else {
            return false
        }
    }

    var body: some View {
        Text(contents)
            .multilineTextAlignment(.center)
            .font(.custom(CustomFonts.DelaGothicOne, size: fontSize))
            .frame(width: descriptiveBulletPoint ? 130 : 15, height: descriptiveBulletPoint ? 40 : 15)
            .background(.violet)
            .foregroundColor(.yellowGradient)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .shadow(radius: 15)
    }
}

struct BulletPoint_Previews: PreviewProvider {
    static var previews: some View {
        BulletPoint()
    }
}
