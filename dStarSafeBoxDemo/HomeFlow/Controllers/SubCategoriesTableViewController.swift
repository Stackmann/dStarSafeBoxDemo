//
//  SubCategoriesTableViewController.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 05.08.2021.
//

import UIKit

class SubCategoriesTableViewController: UITableViewController, HomeView {

    var openActivityFlow: (() -> Void)?
    var onCategoryTap: ((ItemsViewPresenter?, IndexPath) -> Void)?
    var viewPresenter: ItemsViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let presenter = viewPresenter {
            return presenter.subCategories.count
        } else { return 0 }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCellIdentifier", for: indexPath)

        if let presenter = viewPresenter, presenter.subCategories.indices.contains(indexPath.row) {
            let category = presenter.subCategories[indexPath.row]
            if let categoryName = category.name { cell.textLabel?.text = categoryName }
        }
        return cell
    }
    
}
