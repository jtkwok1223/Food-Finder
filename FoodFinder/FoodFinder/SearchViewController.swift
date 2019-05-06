//
//  SearchViewController.swift
//  Food Finder
//
//  Created by GEGWC10 on 5/4/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import UIKit







class SearchViewCell: UITableViewCell {
    
    @IBOutlet weak var searchViewImage: UIImageView!
    @IBOutlet weak var RestaurantName: UILabel!
    
    
@IBOutlet weak var DistanceAway: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}






    class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
        
        var places : [Place] = []
        var userLong : Double = 0
        var userLat : Double = 0
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return places.count // TODO: make this number of restaurants returned
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "restaurant_cell") as? SearchViewCell {
                cell.RestaurantName.text = places[indexPath.row].name //TODO: put name here (get index from indexPath.row)
                cell.DistanceAway.text = String(distanceMiles(places[indexPath.row])) + "Miles" // TODO: put distance away here
                cell.searchViewImage.image = UIImage(named: "placeholderDrink")
                return cell
            }
            return UITableViewCell()
        }
        
        func distanceMiles(_ p: Place) -> Double {
            return (pow(userLong - p.longitude!, 2) + pow(userLat - p.latitude!, 2)).squareRoot()
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // segue to RestaurantView
            performSegue(withIdentifier: "search_to_restaurant_segue", sender: nil)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.destination is ViewRestaurantViewController {
                //dest.Restaurant = Restaurant; TODO: Set proper restaurant for the view restaurant view
            }
        }
    
    @IBOutlet weak var SearchRestaurantsView: UITableView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchRestaurantsView.delegate = self
        SearchRestaurantsView.dataSource = self

        // Do any additional setup after loading the view.
    }

}
