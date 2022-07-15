//
//  HabitDiaryItem.swift
//  HabitDiarySwiftUI
//
//  Created by @andreev2k on 13.07.2022.
//

import Foundation

struct HabitDiaryItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let text: String
    let action: String
    let time: String
    let date: Date
}
