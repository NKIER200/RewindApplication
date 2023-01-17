//
//  dcView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 17/01/2023.
//

import SwiftUI

struct dcView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var fieldGoals = 3
    @State private var fieldGoalAttempts = 3
    @State private var review = ""
    @State private var createdAt = Date()
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Title of entry", text: $title)
                    TextEditor(text: $review)
                    
                }
                Section {
                    Picker("Field Goals made", selection: $fieldGoals) {
                        ForEach(0..<500) {
                            Text(String($0))
                        }
                    }
                    Picker("Field Goals attempted", selection: $fieldGoalAttempts) {
                        ForEach(0..<500) {
                            Text(String($0))
                        }
                    }
                    DatePicker("entrydate", selection:$createdAt, in: ...Date(), displayedComponents: .date)
                } header: { Text("Document your training")
                    
                }
                Section {
                    Button("Save") {
                        //add entry
                        let newEntry = ToDoItem(context: moc)
                        newEntry.id = UUID()
                        newEntry.title = title
                        newEntry.review = review
                        newEntry.fieldGoals = Int16(fieldGoals)
                        newEntry.fieldGoalAttempts = Int16(fieldGoalAttempts)
                        newEntry.createdAt = createdAt
                        
                        try? moc.save()
                        dismiss()
                        
                    }
                }
                
            }
            .navigationTitle("Add Entry")
            
        }
        
        
    }
}

struct dcView_Previews: PreviewProvider {
    static var previews: some View {
        dcView()
    }
}
