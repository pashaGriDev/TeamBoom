//
//  GameSettingsHelpView.swift
//  TeamBoom
//
//  Created by Андрей Бородкин on 12.08.2023.
//

import SwiftUI

struct GameSettingsHelpView: View {
    // MARK: - States&Properties
    
    private var rulesArray = settingsHelp.components(separatedBy: "\n")
    private var updatedArray: [[String]] {
        updateStringArrayForSettings(array: rulesArray)
    }
    
    // MARK: - UI
    
    var body: some View {
        ZStack{
            BackgroundGradientView()
            ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 15) {
                Text("Настройки")
                    .modifier(ToolBarButtonModifer())
                ForEach(updatedArray, id: \.self) {element in
                    
                    if element[0] == "*" {
                        SettingHelpView(bulletPoint: element[1], descriptiveBulletPoint: false, specialFormat: true)
                        
                    } else if element.count > 1 {
                        SettingHelpView(bullet: element[0],bulletPoint: element[1], descriptiveBulletPoint: true)
                    } else {
                        SettingHelpView(bulletPoint: element.first!, descriptiveBulletPoint: false)
                    }
                    
                }
                
            }
        }
            .padding(.leading, 20)
            .padding(.trailing, 20)
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

struct GameSettingsHelpView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsHelpView()
    }
}
