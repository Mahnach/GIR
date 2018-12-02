//
//  MainMapViewController.swift
//  SquareApp
//
//  Created by computer_new on 12/2/18.
//  Copyright © 2018 Square. All rights reserved.
//

import UIKit
import Mapbox

class MainMapViewController: UIViewController {
    @IBOutlet weak var mapView: MGLMapView!
    
    @IBAction func moveToCurrentLocationTouched(_ sender: UIButton) {
        moveToCurrentLocation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let search = UISearchController(searchResultsController: nil)
        navigationItem.titleView = search.searchBar
        tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tabbar_map"), tag: 0)
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        
        
        mapView.showsUserLocation = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.moveToCurrentLocation()
        }
    }
    
    
    func moveToCurrentLocation() {
        if let userLocation = self.mapView.userLocation {
            
            let camera = MGLMapCamera(lookingAtCenter: userLocation.coordinate, fromDistance: 4000, pitch: 0, heading: 0)
            self.mapView.fly(to: camera, completionHandler: nil)
        }
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
