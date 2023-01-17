//
//  textEditorView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 24/12/2022.
//
//
//import SwiftUI
//import CoreData
//
//struct TextInputView: View {
//    @Environment(\.managedObjectContext) var managedObjectContext
//    @State private var title: String = ""
//    
//    var body: some View {
//        VStack {
//            TextField("Enter title", text: $title)
//                .padding()
//            Button(action: {
//                let toDoItem = ToDoItem(context: self.managedObjectContext)
//                toDoItem.title = self.title
//                toDoItem.createdAt = Date()
//                
//                do {
//                    try self.managedObjectContext.save()
//                } catch {
//                    print(error)
//                }
//                
//                self.title = ""
//            }) {
//                Text("Add")
//            }
//        }
//    }
//}
