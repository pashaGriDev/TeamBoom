//
//  MainViewController.swift
//  TeamBoom
//
//  Created by Daniil Kulikovskiy on 07.08.2023.
//

import SwiftUI

struct MainViewController: View {
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()
                VStack {
                    Image("textBomb")
                    Image("bomb")
                    VStack(spacing: 15) {
                        Button() {
                            //Some code for start game...
                        } label: {
                            Text("Старт")
                                .font(.system(size: 22, weight: .bold))
                        }
                        .frame(width: 274, height: 79)
                        .background(.violet)
                        .foregroundColor(.yellowGradient)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(radius: 15)
                        
                        NavigationLink(destination: CategoriesView()) {
                            Text("Категории")
                                .font(.system(size: 22, weight: .bold))
                        }
                        .frame(width: 274, height: 79)
                        .background(.violet)
                        .foregroundColor(.yellowGradient)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .shadow(radius: 15)
                        
                        HStack {
                            Spacer()
                            Image("question-mark")
                                .padding(.trailing, 30)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Игра для компании", displayMode: .inline)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainViewController()
    }
}
