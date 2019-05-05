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
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1 // TODO: make this number of restaurants returned
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "restaurant_cell") as? SearchViewCell {
                cell.RestaurantName.text = "NAME" //TODO: put name here (get index from indexPath.row)
                cell.DistanceAway.text = "0 Miles" // TODO: put distance away here
                cell.searchViewImage.image = UIImage(named: "placeholderDrink")
                return cell
            }
            return UITableViewCell()
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
