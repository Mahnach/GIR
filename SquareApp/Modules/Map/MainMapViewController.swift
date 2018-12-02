//
//  MainMapViewController.swift
//  SquareApp
//
//  Created by computer_new on 12/2/18.
//  Copyright © 2018 Square. All rights reserved.
//

import UIKit

class MainMapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let search = UISearchController(searchResultsController: nil)
        navigationItem.titleView = search.searchBar
        tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tabbar_map"), tag: 0)
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
