//
//  todoentryView.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 17/01/2023.
//

import SwiftUI

struct todoentryView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title)
    ]) var entrys: FetchedResults<ToDoItem>
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(entrys) { entry in
                    NavigationLink {
                        detailedTDView(entry: entry)
                    } label: {
                        HStack {
                            fgRatingView(fieldGoals: entry.fieldGoals)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(entry.title ?? "Unknown Title")
                                    .font(.headline)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteENtry)
                
                Button {
                    showingAddScreen.toggle()
                } label: {
                    Label("Add Entry", systemImage: "plus")
                }
                .sheet(isPresented: $showingAddScreen) {
                    dcView()
                }
                EditButton()
                
            }
            
            Text("Count: \(entrys.count)")
                .navigationTitle("Training sessions")
           
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Entry", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    dcView()
                }
        }
    }
    
    func deleteENtry(at offsets: IndexSet) {
        for offset in offsets {
            let entry = entrys[offset]
            moc.delete(entry)
        }
        try? moc.save()
    }
}

struct todoentryView_Previews: PreviewProvider {
    static var previews: some View {
        todoentryView()
    }
}
