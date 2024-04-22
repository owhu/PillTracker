//
//  PillView.swift
//  PillTracker
//
//  Created by Oliver Hu on 4/15/24.
//

import SwiftUI

struct PillView: View {
    var data: Pills
    var pill: Pill
    
    var body: some View {
        List {
            if pill.description.isEmpty == false {
                Section {
                    Text(pill.description)
                }
            }
            
            Section {
                Text("Pills taken: \(pill.completionCount)")
                
                Button("Add Pill") {
                    var newPill = pill
                    newPill.completionCount += 1
                    
                    if let index = data.pills.firstIndex(of: pill) {
                        data.pills[index] = newPill
                    }
                }
                
                Button("Remove Pill") {
                    var newPill = pill
                    newPill.completionCount -= 1
                    
                    if let index = data.pills.firstIndex(of: pill) {
                        data.pills[index] = newPill
                    }
                }
                
                Button("Reset") {
                    var newPill = pill
                    newPill.completionCount = 0
                    
                    if let index = data.pills.firstIndex(of: pill) {
                        data.pills[index] = newPill
                    }
                }
            }
        }
        .navigationTitle(pill.title)
    }
}

#Preview {
    PillView(data: Pills(), pill: .example)
}
