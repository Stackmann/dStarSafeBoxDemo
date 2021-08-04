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
    
    init(model: ItemsModel, view: HomeView) {
        self.model = model
        self.view = view
    }
}
