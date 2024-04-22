//
//  ContentView.swift
//  PillTracker
//
//  Created by Oliver Hu on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Pills()
    @State private var addingNewPill = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.pills) { pill in
                    NavigationLink {
                        PillView(data: data, pill: pill)
                    } label: {
                        HStack {
                            Text(pill.title)
                            
                            Spacer()
                            
                            Text(String(pill.completionCount))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: pill))
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Pills")
            .toolbar {
                Button("Add new pill", systemImage: "plus") {
                    addingNewPill.toggle()
                }
            }
            .sheet(isPresented: $addingNewPill) {
                AddPill(data: data)
            }
        }
    }
    
    func color(for pill: Pill) -> Color {
        if pill.completionCount <  3 {
            .red
        } else if pill.completionCount < 5 {
            .yellow
        } else if pill.completionCount < 7 {
            .green
        } else if pill.completionCount < 9 {
            .blue
        } else {
            .indigo
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        data.pills.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
