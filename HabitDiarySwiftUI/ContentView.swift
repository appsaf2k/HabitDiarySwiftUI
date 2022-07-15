//
//  ContentView.swift
//  HabitDiarySwiftUI
//
//  Created by @andreev2k on 13.07.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habitDiary: HabitDiaryJSON
    @State private var showingAddHabit = false
    @State private var showin = false
    @State private var showSheetEdit = false
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitDiary.items) { item in
                    NavigationLink(destination: VStack {
                        VStack {
                            Text(item.name)
                                .font(.headline)
                                .lineLimit(2)
                            Text("\(item.date.formatted(date: .complete, time: .omitted))")
                                .foregroundStyle(.secondary)
                        }
                        
                        Text(item.text).padding()
                        Spacer()
                        
                    }){
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                    .lineLimit(2)
                                
                                Text("\(item.date.formatted(date: .complete, time: .omitted))")
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("\(item.time) hrs")
                                    .font(.headline)
                                Text(item.action)
                                    .foregroundStyle(.secondary)
                                
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
                .onMove(perform: move)
                
            }
            .navigationTitle("Habit Diary")
            .toolbar {
                EditButton()
                
                Button{
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddView(habitDiary: habitDiary)
            }
            
        }
    }
    
    
    func removeItems(at offsets: IndexSet){
        habitDiary.items.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        habitDiary.items.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(habitDiary: HabitDiaryJSON())
    }
}
