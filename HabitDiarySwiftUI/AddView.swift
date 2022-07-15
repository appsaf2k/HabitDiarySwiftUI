//
//  AddView.swift
//  HabitDiarySwiftUI
//
//  Created by @andreev2k on 13.07.2022.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var habit: HabitData
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var text = ""
    @State private var action = "Personal"
    @State private var time = ""
    @State private var date = Date.now
    
    let types = ["Personal", "Business", "Sport", "Games", "Hobbies"]
    
       
    var body: some View {
        NavigationView {
           List {
               TextField("Name", text: $name)
                
               VStack {
                   TextEditor(text: $text)
                   .font(.headline)
               }
                
                Picker("Type", selection: $action) {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Time Action", text: $time)
                   .keyboardType(.numberPad)
               
               Section {
                   DatePicker("Date from action:", selection: $date, displayedComponents: .date).datePickerStyle(.graphical)
               }
                
                
           }
            .navigationTitle("Add New Habit")
            .toolbar {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                    Button("Save") {
                        let item = HabitItem(name: name, text: text, action: action, time: time, date: date)
                        habit.items.insert(item, at: 0)
                        dismiss()
                    }
                }
            }
        }
    }
}

        
        
        
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habit: HabitData())
    }
}
