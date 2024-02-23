//
//  ItemsViewModel.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 04.08.2021.
//

import Foundation

class ItemsViewPresenter {
    let model: ItemsModel
    weak var view: HomeView?
    var topCategories = [Categories]()
    var subCategories = [Categories]()
    
    var newStrVariable1: String?
    
    init(model: ItemsModel, view: HomeView) {
        self.model = model
        self.view = view
        reloadTopCategories()
    }
    
    func reloadTopCategories() {
        topCategories = model.getTopCategories()
    }

    func updateSubCategories(with category: Categories) {
        subCategories = model.getSubCategories(with: category)
    }
}
