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
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading, spacing: 25) {
                        Text("Правила игры")
                            .modifier(ToolBarButtonModifer())
                        ForEach(rulesArray.indices, id: \.self) { index in

                            switch index {
                            case 1:
                                RuleView(index: index + 1, content: rulesArray[index], buttonLabel: "Старт игры")
                            case 6:
                                RuleView(index: index+1, content: rulesArray[index], specialFormatting: true)

                            default:
                                RuleView(index: index+1, content: rulesArray[index])

                            }

                        }

                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Помощь")
                                .modifier(ToolBarButtonModifer())
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            }
        }
    }
}

// MARK: - Preview

struct GameRulesView_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}
