//
//  GameCategoriesView.swift
//  TeamBoom
//
//  Created by Иван Лясковец on 11.08.2023.
//

import SwiftUI

struct GameCategoriesView: View {
	// MARK: - States&Properties

	private let helpCategories: [String: String] = ["Путешествия": "airplane", "Еда и напитки": "leaf.fill", "Кино и телевидение": "film.fill", "Музыка": "music.note"]
	private let columns = [GridItem(.adaptive(minimum: 175))]

	// MARK: - UI

    var body: some View {
        ZStack {
            BackgroundGradientView()
            VStack {
                ScrollView {
                    Text("Категории")
                        .modifier(ToolBarButtonModifer())
                    Spacer()
                    Text("В игре доступно 6 категорий и более 90 вопросов.")
                        .font(.custom(CustomFonts.DelaGothicOne, size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Text("Можно выбрать сразу несколько категорий для игры.")
                        .font(.custom(CustomFonts.DelaGothicOne, size: 24))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    LazyVGrid(columns: columns) {
                        ForEach(helpCategories.keys.sorted(), id: \.self) { category in
                            Button {
                            } label: {
                                ZStack {
                                    VStack(alignment: .leading) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .position(x: 30, y: 30)
                                    }
                                    VStack {
                                        Image(systemName: helpCategories[category] ?? "")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .foregroundColor(.yellowOfButton)
                                        Text(category)
                                            .foregroundColor(.yellowOfButton)
                                            .font(.custom(CustomFonts.DelaGothicOne, size: 16))
                                            .padding(.horizontal)
                                    }
                                }
                                .frame(width: 175, height: 175)
                                .background(Color(red: 0.5, green: 0.18, blue: 0.65))
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 50)
                                        .stroke(.black)
                                }
                            }
                            .buttonStyle(ThemeAnimationStyle())
                            .padding(.vertical, 4)
                        }
                    }
                    .padding()
                }
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

// MARK: - Preview

struct GameCategoriesView_Previews: PreviewProvider {
	static var previews: some View {
		GameCategoriesView()
	}
}
