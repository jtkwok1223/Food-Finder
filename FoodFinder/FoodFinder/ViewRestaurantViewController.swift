//
//  ViewRestaurantViewController.swift
//  Food Finder
//
//  Created by Turese Anderson on 4/28/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import UIKit

class MenuItemViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var MenuItemName: UILabel!
    
    @IBOutlet weak var MenuItemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class AddItemViewCell: UITableViewCell {
    
    @IBOutlet weak var AddItemButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
                // Configure the view for the selected state
    }
}
class ViewRestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Restaurant: Place = Place()
    
    @IBOutlet weak var RestaurantName: UILabel!
    
    @IBOutlet weak var RestaurantHours: UILabel!
    
    @IBOutlet weak var RestaurantImage: UIImageView!
    
    @IBOutlet weak var MenuView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Restaurant.MenuToppings.count + Restaurant.MenuItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menucount = Restaurant.MenuItems.count
        if indexPath.row < menucount {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as? MenuItemViewCell {
                cell.MenuItemName.text = Restaurant.MenuItems[indexPath.row]
                cell.MenuItemPrice.text = FormatPrice(price: Restaurant.MenuPrices[indexPath.row])
                cell.itemImage.image = UIImage(named: "placeholderDrink")
                return cell
            }
        }
        else if indexPath.row  < menucount + Restaurant.MenuToppings.count {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as? MenuItemViewCell {
                cell.MenuItemName.text = Restaurant.MenuToppings[indexPath.row - menucount]
                cell.itemImage.image = UIImage(named: "placeholderTopping")
                return cell
            }
            
        }
        else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "add_item") as? AddItemViewCell {
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuView.delegate = self
        MenuView.dataSource = self
        makedummyplace()
        RestaurantName.text  = Restaurant.name
        RestaurantHours.text = "TEST"
        
        
        // Do any additional setup after loading the view.
    }
    
    func makedummyplace() {
        let storeTimes: [String] = ["-","-","-","-","-","-","-"]
        Restaurant = Place("Boba Cafe", "123 Street", storeTimes)
        Restaurant.MenuItems = ["Milk Tea", "Thai Milk Tea", "Ice Cream Milk Tea", "Green Apple Tea"]
        Restaurant.MenuAttrs = ["", "", "", ""]
        Restaurant.MenuPrices = [3.3, 3.35, 4.00, 4]
        Restaurant.MenuToppings = ["Pearl", "Ice Cream", "Egg Pudding"]
    }
    
    func FormatPrice(price: Float) -> String {
        var priceString = String(price)
        priceString = "$" + priceString
        return priceString
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
