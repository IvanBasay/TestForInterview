//
//  PersistanceManager.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import Foundation
import CoreData

class PersistanceManager {
    
    private init() {}
    
    static var shared: PersistanceManager {
        return PersistanceManager()
    }
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "TestTask")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = PersistanceManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                print("data was saved to coredata")
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Fetch requests
    
    func fetchContactWithEmail(email: String) -> Contact? {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        let resultContacts = try! PersistanceManager.context.fetch(fetchRequest)
        return resultContacts.first
    }
    
    func fetchAllContacts() -> [ContactModel] {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        let resultContacts = try! PersistanceManager.context.fetch(fetchRequest)
        var contacts: [ContactModel] = []
        for resultContact in resultContacts {
            let contact = ContactModel(name: resultContact.name, secondName: resultContact.secondName, email: resultContact.email, photoData: resultContact.photo, sourceType: .local)
            contacts.append(contact)
        }
        return contacts
    }
    
    func deleteContactWithEmail(email: String) {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        let resultContacts = try! PersistanceManager.context.fetch(fetchRequest)
        guard let contact = resultContacts.first else { return }
        DispatchQueue.global().async {
            PersistanceManager.context.delete(contact)
            try? PersistanceManager.context.save()
        }
    }
    
    // MARK: - Save requests
    
    func saveContact(_ contact: ContactModel) {
        let dataContact = Contact(context: PersistanceManager.context)
        dataContact.name = contact.name
        dataContact.email = contact.email
        dataContact.secondName = contact.secondName
        if let url = contact.photoURL {
            dataContact.photo = try? Data(contentsOf: url)
        }
        PersistanceManager.shared.saveContext()
    }
}
