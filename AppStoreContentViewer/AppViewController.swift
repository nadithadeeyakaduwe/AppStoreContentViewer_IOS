//
//  ViewController.swift
//  AppStoreContentViewer
//
//  Created by Hasitha Epitawala on 10/3/18.
//  Copyright © 2018 Naditha Deeyakaduwe. All rights reserved.
//

import UIKit

class AppViewController: UIViewController, UISearchBarDelegate {
    
    var checkList =  [
        AppStoreItem(image: "a", title: "Birthdays", discription: "7"),
        AppStoreItem(image: "a", title: "Business Stuff", discription: "7"),
        AppStoreItem(image: "a", title: "Chros", discription: "7"),
        AppStoreItem(image: "a", title: "Todos", discription: "7"),
        AppStoreItem(image: "a", title: "Groceries", discription: "7"),
        AppStoreItem(image: "a", title: "Trips", discription: "7"),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("load called")
        self.appTableView.dataSource = self
        searchBar.delegate = self
    }
    
    
    @IBOutlet weak var appTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var apiService = AppStoreApiService();
    

    func searchBarSearchButtonClicked( _ searchBar: UISearchBar)
    {
        let searchText = searchBar.text!
        let result = apiService.getAppData(searchText)
//        print("result is :  \(result)")
    }
    
    
}

extension AppViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.checkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CheckListCell")
        cell.accessoryType = .detailDisclosureButton
        
        cell.textLabel?.text = self.checkList[indexPath.row].title
        cell.detailTextLabel?.text = self.checkList[indexPath.row].discription + "Remaining"
        cell.imageView?.image = UIImage(named: self.checkList[indexPath.row].image)
        
        return cell
        //.text = selft.checkListData[indexPath.row]
        
    }
    
}

