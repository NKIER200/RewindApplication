//
//  ToDoItem.swift
//  Kier_Nathan_Rewind
//
//  Created by Nathan Kier on 24/12/2022.
//

//import Foundation
//import CoreData
//
//class testModel.ToDoItem: NSManagedObject {
//    @NSManaged public var title: String?
//    @NSManaged public var createdAt: Date?
//    @NSManaged public var user: User?
//    @NSManaged public var model: testModel?
//    
//    convenience init(title: String, user: User, context: NSManagedObjectContext) {
//        self.init(context: context)
//        self.title = title
//        self.createdAt = createdAt
//        self.user = user
//    }
//    
//    func save() {
//        do {
//            try self.managedObjectContext?.save()
//        } catch {
//            print("Error saving ToDoItem: \(error)")
//        }
//    }
//    
//    func delete() {
//        self.managedObjectContext?.delete(self)
//    }
//    
//    static func getAllToDoItems() -> NSFetchRequest<TestModel.ToDoItem> {
//        let request: NSFetchRequest<TestModel.ToDoItem> = TestModel.ToDoItem.fetchRequest() as! NSFetchRequest<TestModel.ToDoItem>
//        
//        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
//        
//        request.sortDescriptors = [sortDescriptor]
//        
//        return request
//    }
//}
//
//
//
