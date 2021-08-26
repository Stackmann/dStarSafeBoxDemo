//
//  HomeViewController.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//

import UIKit

class HomeViewController: UIViewController, HomeView, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var openActivityFlow: (() -> Void)?
    var onCategoryTap: ((ItemsViewPresenter?, IndexPath) -> Void)?
    var viewPresenter: ItemsViewPresenter?
    
    @IBOutlet weak var accountTableView: UITableView!
    @IBOutlet weak var categoriesColectionView: UICollectionView!
    
    let accountCellsCount = 2

    // MARK: - lifecycle viewController metods

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.systemGray5
        navigationController?.navigationBar.isTranslucent = false
        setupTableview()
        setupCollectionView()
    }
    
    // MARK: - lifecycle tableView metods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountCellsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "accountRow1Cell", for: indexPath)
            cell.selectionStyle = .none
            cell.textLabel?.text = "Sophie Waterford"
            cell.detailTextLabel?.text = "Business account"
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "accountRow2Cell", for: indexPath)
            cell.selectionStyle = .none
            cell.textLabel?.text = "Israel"
            cell.detailTextLabel?.text = "Company Name"
        }
        return cell
    }

    // MARK: - lifecycle collectionView metods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: CategoriesCollectionViewCell
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true

        if let presenter = viewPresenter, presenter.topCategories.indices.contains(indexPath.row) {
            let category = presenter.topCategories[indexPath.row]
            if let categoryName = category.name { cell.configure(with: categoryName) }
        } else {
            cell.configure(with: "Error: Empty base")
        }
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCategoryTap?(viewPresenter, indexPath)
    }

    @IBAction func addCategoriesByDefaultButtonPressed(_ sender: UIButton) {
        viewPresenter?.model.addCategoriesByDefault()
    }
    
    // MARK: - own metods
    
    func setupTableview() {
        accountTableView.delegate = self
        accountTableView.dataSource = self
        accountTableView.tableFooterView = UIView()

        accountTableView.layer.borderColor = UIColor.gray.cgColor
        accountTableView.layer.borderWidth = 1.0

        accountTableView.layer.cornerRadius = 10
        accountTableView.layer.masksToBounds = true

        let containerView:UIView = UIView(frame:accountTableView.frame)
        containerView.backgroundColor = UIColor.clear
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 10, height: 10) //Right-Bottom
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowRadius = 2
        self.view.addSubview(containerView)
        containerView.addSubview(accountTableView)
        
    }
    
    func setupCollectionView() {
        categoriesColectionView.delegate = self
        categoriesColectionView.dataSource = self
    }
}
