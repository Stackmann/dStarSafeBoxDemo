//
//  ItemsModel.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 04.08.2021.
//

import CoreData

struct ItemsModel {
    var topCategories: [Categories] {
        getTopCategories()
    }
    
    let context: NSManagedObjectContext
    
    private func getTopCategories() -> [Categories] {
        let fetchRequest: NSFetchRequest<Categories> = Categories.fetchRequest()
        do {
            let topCategories = try context.fetch(fetchRequest)
            return topCategories
        } catch {
            let error = error 
            print(error)
            return []
        }
    }
}
