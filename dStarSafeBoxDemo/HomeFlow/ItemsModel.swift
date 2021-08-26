//
//  ItemsModel.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 04.08.2021.
//

import CoreData

struct ItemsModel {
    let context: NSManagedObjectContext
    
    func getTopCategories() -> [Categories] {
        let fetchRequest: NSFetchRequest<Categories> = Categories.fetchRequest()
        let condition = NSPredicate(format: "parent == nil")
        fetchRequest.predicate = condition
        do {
            let topCategories = try context.fetch(fetchRequest)
            return topCategories
        } catch {
            let error = error
            print(error)
            return []
        }
    }

    func getSubCategories(with category: Categories) -> [Categories] {
        let fetchRequest: NSFetchRequest<Categories> = Categories.fetchRequest()
        let condition = NSPredicate(format: "parent == %@", category)
        fetchRequest.predicate = condition
        do {
            let topCategories = try context.fetch(fetchRequest)
            return topCategories
        } catch {
            let error = error
            print(error)
            return []
        }
    }

    func addCategoriesByDefault() {
        let newCategory1 = Categories(context: context)
        newCategory1.name = "Financial"
        let newCategory1_1 = Categories(context: context)
        newCategory1_1.name = "Credit card"
        newCategory1_1.parent = newCategory1
        let newCategory1_2 = Categories(context: context)
        newCategory1_2.name = "Bank account"
        newCategory1_2.parent = newCategory1
        let newCategory2 = Categories(context: context)
        newCategory2.name = "Corporate"
        let newCategory3 = Categories(context: context)
        newCategory3.name = "ID Documents"
        let newCategory3_1 = Categories(context: context)
        newCategory3_1.name = "Passport"
        newCategory3_1.parent = newCategory3
        let newCategory4 = Categories(context: context)
        newCategory4.name = "Other"

        do {
            try context.save()
        } catch {
            let error = error
            print(error)
        }    }
}
