//
//  HomeCoordinator.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//
import UIKit

final class HomeCoordinator: BaseCoordinator, HomeCoordinatorOutput {
    
    var openActivityFlow: (() -> Void)?
    
    private let factory: HomeModuleFactory
    private let router: Router
    var homePresenter: ItemsViewPresenter?
    
    init(router: Router, factory: HomeModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showMainView()
    }
    
    //MARK: - Run current flow's controllers
    
    private func showMainView() {
        let homeView = factory.makeHomeView()
        
        let model = ItemsModel(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        homePresenter = ItemsViewPresenter(model: model, view: homeView)
        homeView.viewPresenter = homePresenter
        
        homeView.openActivityFlow = openActivityFlow

        homeView.onCategoryTap = { [weak self] viewPresenter, indexPath in
            if let presenter = viewPresenter, presenter.topCategories.indices.contains(indexPath.row) {
                let category = presenter.topCategories[indexPath.row]
                self?.showSubCategory(with: category)
            }
        }
        router.setRootModule(homeView) // !!! reconsiderate
    }
    
    private func showSubCategory(with parentCategory: Categories) {
      let subCategoriesView = factory.makeSubCategoriesView()
        homePresenter?.updateSubCategories(with: parentCategory)
        subCategoriesView.viewPresenter = homePresenter
        
        subCategoriesView.openActivityFlow = openActivityFlow
        subCategoriesView.onCategoryTap = { [weak self] viewPresenter, indexPath in
            if let presenter = viewPresenter, presenter.topCategories.indices.contains(indexPath.row) {
                let category = presenter.topCategories[indexPath.row]
                self?.showItemList(with: category)
            }
      }
      router.push(subCategoriesView)
    }
    
    private func showItemList(with category: Categories) {
        
    }

}
