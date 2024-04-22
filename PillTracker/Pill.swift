//
//  Pill.swift
//  PillTracker
//
//  Created by Oliver Hu on 4/15/24.
//

import Foundation

struct Pill: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Pill(title: "Example pill", description: "This is a test pill.")
}
