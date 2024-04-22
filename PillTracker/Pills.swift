//
//  Pills.swift
//  PillTracker
//
//  Created by Oliver Hu on 4/15/24.
//

import Foundation

@Observable
class Pills {
    var pills: [Pill] {
        // items get saved when items are added
        didSet {
            if let encoded = try? JSONEncoder().encode(pills) {
                UserDefaults.standard.set(encoded, forKey: "Pills")
            }
        }
    }
    
    // items are loaded when app relaunches
    init() {
        if let saved = UserDefaults.standard.data(forKey: "Pills") {
            if let decoded = try? JSONDecoder().decode([Pill].self, from: saved) {
                pills = decoded
                return
            }
        }

        pills = []
    }
}
