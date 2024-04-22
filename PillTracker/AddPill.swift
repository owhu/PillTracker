//
//  AddPill.swift
//  PillTracker
//
//  Created by Oliver Hu on 4/15/24.
//

import SwiftUI

struct AddPill: View {
    var data: Pills
    
    @State private var title = ""
    @State private var description = ""

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Pill")
            .toolbar {
                Button("Save") {
                    let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitle.isEmpty == false else { return }

                    let pill = Pill(title: trimmedTitle, description: description)
                    data.pills.append(pill)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddPill(data: Pills())
}
