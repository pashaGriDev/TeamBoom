//
//  GameRulesView.swift
//  TeamBoom
//
//  Created by Андрей Бородкин on 10.08.2023.
//

import SwiftUI

struct GameRulesView: View {
    // MARK: - States&Properties
    
    private var rulesArray = rules.components(separatedBy: "\n")
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                VStack(alignment: .center, spacing: 25) {
                    ForEach(rulesArray.indices, id: \.self) { index in
                        
                        
                        switch index {
                        case 1:
                            RuleView(index: index + 1, content: rulesArray[index], buttonLabel: "Старт игры")
                        case 6:
                            RuleView(index: index+1, content: rulesArray[index], specialFormatting: true)
                            
                        default :
                            RuleView(index: index+1, content: rulesArray[index])
                            
                        }
                  
                    }
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Правила игры")
                            .font(.custom(CustomFonts.DelaGothicOne, size: 30))
                            .foregroundColor(.violet)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
        }
    }
}

// MARK: - Preview

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}

// MARK: - RuleView

struct RuleView: View {
    
    var fontSize: CGFloat = 18
    
    var index: Int
    var content: String
    var buttonLabel: String?
    var withButton: Bool {
        if let label = buttonLabel {
            return !label.isEmpty ? true : false
        }
        return false
    }
    var specialFormatting: Bool?
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            HStack (alignment: .top) {
                Text(String(index))
                    .multilineTextAlignment(.center)
                    .font(.custom(CustomFonts.DelaGothicOne, size: fontSize))
                    .frame(width: 40, height: 40)
                    .background(.violet)
                    .foregroundColor(.yellowGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(radius: 15)
                
                if let specialFormatting = specialFormatting, specialFormatting == true {
                    SpecialText(content: content)
                        .font(.custom(CustomFonts.DelaGothicOne, size: fontSize))
                        .multilineTextAlignment(.center)
                } else {
                    Text(content)
                        .font(.custom(CustomFonts.DelaGothicOne, size: fontSize))
                        .foregroundColor(Color(.init(red: 60/255, green: 58/255, blue: 58/255, alpha: 1)))
                        .multilineTextAlignment(.center)
                }
            }
            
            if withButton {
                Text(String(buttonLabel!))
                    .multilineTextAlignment(.center)
                    .font(.custom(CustomFonts.DelaGothicOne, size: fontSize))
                    .frame(width: 150, height: 40)
                    .background(.violet)
                    .foregroundColor(.yellowGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .shadow(radius: 15)
                    .offset(x: 25)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct SpecialText: View {
    
    var content: String
    
    var textArray: [String] {
        return content.components(separatedBy: "\"")
    }
    
    var body: some View {
        Text("Если в настройках выбран режим игры ").foregroundColor(Color(.init(red: 60/255, green: 58/255, blue: 58/255, alpha: 1))) +
        Text("\"С заданиями\"").foregroundColor(.violet) +
        Text(", то проигравший выполнит задание")
    }
}
