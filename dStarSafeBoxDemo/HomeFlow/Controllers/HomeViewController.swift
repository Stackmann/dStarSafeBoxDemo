//
//  HomeViewController.swift
//  dStarSafeBoxDemo
//
//  Created by admin on 03.08.2021.
//

import UIKit

class HomeViewController: UIViewController, HomeView, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var openActivityFlow: (() -> Void)?
    
    @IBOutlet weak var accountTableView: UITableView!
    @IBOutlet weak var categoriesColectionView: UICollectionView!
    
    let accountCellsCount = 2

    // MARK: - lifecycle viewController metods

    override func viewDidLoad() {
        super.viewDidLoad()

        accountTableView.delegate = self
        accountTableView.dataSource = self
        accountTableView.tableFooterView = UIView()
        //accountTableView.backgroundColor = UIColor.mainGrey
        //accountTableView.separatorStyle = .none
        categoriesColectionView.delegate = self
        categoriesColectionView.dataSource = self
    }
    
    // MARK: - lifecycle tableView metods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountCellsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "accountRow1Cell", for: indexPath)
            //cell.backgroundColor = UIColor.mainGrey
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        for i in 0...cellsCount-1 {
//            if let cell = tableViewKindAdding.cellForRow(at: IndexPath(row: i, section: 0)) {
//                cell.accessoryType = (i == indexPath.row ? .checkmark : .none)
//                if i == 0 && cell.accessoryType == .checkmark || i == 1 && cell.accessoryType == .none {
//                    viewModel.appendRecords = true
//                } else {
//                    viewModel.appendRecords = false
//                }
//            }
//        }
    }

    // MARK: - lifecycle collectionView metods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: CategoriesCollectionViewCell
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoriesCollectionViewCell
        switch indexPath.row {
        case 0:
            cell.configure(with: "Finance")
        case 1:
            cell.configure(with: "Corporate")
        case 2:
            cell.configure(with: "ID Documents")
        default:
            cell.configure(with: "Other")
        }
        return cell

    }

}
