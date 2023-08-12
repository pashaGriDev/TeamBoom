//
//  RuleSet.swift
//  TeamBoom
//
//  Created by Андрей Бородкин on 10.08.2023.
//
// swiftlint:disable line_length

import Foundation

let rules =
"""
Все игроки становятся в круг.
Первый игрок берет телефон и нажимает кнопку:
На экране появляется вопрос 'Назовите Фрукт'.
Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники).
Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.
Проигравшим считается тот, в чьих руках взорвалась бомба.
Если в настройках выбран режим игры 'С заданиями', то проигравший выполняет задание.
"""

let settingsHelp =
"""
В настройках игры можно задать время взрыва бомбы:
-Короткое Бомба взорвется в течение 10 секунд.
-Среднее Бомба взорвется в течение 20 секунд.
-Длинное бомба взорвется в течение 45 секунд.
-Случайное Бомба взорвется в течение 10-45 секунд.
Если выбран режим \"С заданиями\", то после взрыва бомбы на экране будет появляться задание для проигравшего игрока
*Также в настройках можно
Включить / Отключить фоновую музыку.
Выбрать звуки для фоновой музыки, тиканья бомбы и взрыва.
"""

func updateStringArrayForSettings(array: [String]) -> [[String]]{
    let updatedArray = array.map { line in
                
        if line.starts(with: "-") {
            var cleanString = line
            cleanString.removeFirst()

            var wordsArray = cleanString.components(separatedBy: " ")
            let bullet = wordsArray.removeFirst()
            let bulletPoint = wordsArray.joined(separator: " ")
            
            return [bullet, bulletPoint]
            
        } else if line.starts(with: "*") {
            var bulletPoint = line
            bulletPoint.removeFirst()
            
            return ["*", bulletPoint]
        }
        return [line]
    }
    return updatedArray
}
// swiftlint:enable line_length
