//
//  CoreDataManager.swift
//  Practice_CoreData
//
//  Created by 이준혁 on 2023/02/10.
//

import CoreData
import Foundation

class CoreDataManager {
    static var shared: CoreDataManager = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Notice")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: context와 북마크 Entity를 가져온다.
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var bookmarkEntity: NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: "Bookmark", in: context)
    }
    
    // MARK: Context 저장하기
    func saveContext () {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func insertBookmark(_ notice: Notice) {
        if let entity = bookmarkEntity {
            let managedObject = NSManagedObject(entity: entity,
                                                insertInto: context)
            managedObject.setValue(notice.title, forKey: "title")
            managedObject.setValue(notice.time, forKey: "time")
            managedObject.setValue(notice.url, forKey: "url")
            saveContext()
        }
    }
    
    // MARK: Read
    func fetchBookmarks() -> [Bookmark] {
        do {
            let request = Bookmark.fetchRequest()
            let results = try context.fetch(request)
            return results
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func getBookmarks() -> [Notice] {
        var notices: [Notice] = []
        let fetchResults = fetchBookmarks()
        for result in fetchResults {
            let notice = Notice(title: result.title ?? "",
                                time: result.time ?? "",
                                url: result.url ?? "")
            notices.append(notice)
        }
        return notices
    }
    
    // MARK: Update
    func updateBookmark(_ notice: Notice) {
        let fetchResults = fetchBookmarks()
        for result in fetchResults {
            if result.url == notice.url {
                result.title = "업데이트한 제목"
            }
        }
        saveContext()
    }
    
    // MARK: Delete
    func deleteBookmark(_ notice: Notice) {
        let fetchResults = fetchBookmarks()
        let notice = fetchResults.filter({ $0.url == notice.url })[0]
        context.delete(notice)
        saveContext()
    }
    
    func deleteAllBookmark() {
        let fetchResults = fetchBookmarks()
        for result in fetchResults {
            context.delete(result)
        }
        saveContext()
    }
}
