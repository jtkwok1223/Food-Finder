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
    
    @IBOutlet weak var MenuItemProperties: UILabel!
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
    
    
    var Restaurant: Place?
    var restaurantname: String = ""
    
    @IBOutlet weak var RestaurantName: UILabel!
    
    @IBOutlet weak var RestaurantHours: UILabel!
    
    @IBOutlet weak var RestaurantImage: UIImageView!
    
    @IBOutlet weak var MenuView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Restaurant!.MenuToppings.count + Restaurant!.MenuItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menucount = Restaurant!.MenuItems.count
        if indexPath.row < menucount {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as? MenuItemViewCell {
                cell.MenuItemName.text = Restaurant!.MenuItems[indexPath.row]
                cell.MenuItemPrice.text = FormatPrice(price: Restaurant!.MenuPrices[indexPath.row])
                cell.itemImage.image = UIImage(named: "placeholderDrink")
                cell.MenuItemProperties.text = FormatAttrs(attrs: Restaurant!.MenuAttrs[indexPath.row])
                return cell
            }
        }
        else if indexPath.row  < menucount + Restaurant!.MenuToppings.count {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as? MenuItemViewCell {
                cell.MenuItemName.text = Restaurant!.MenuToppings[indexPath.row - menucount]
                cell.MenuItemPrice.text = FormatPrice(price: Restaurant!.MenuToppingPrices[indexPath.row - menucount])
                cell.itemImage.image = UIImage(named: "placeholderTopping")
                cell.MenuItemProperties.text = " "
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == Restaurant!.MenuToppings.count + Restaurant!.MenuItems.count {
            performSegue(withIdentifier: "restaurant_to_add_segue", sender: self)
        }
        
    }
    
    @IBAction func unwind_added_item(segue:UIStoryboardSegue) {
        repullFromFB()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Restaurant == nil {
            Restaurant = Place()
            Restaurant!.name = "ShareTea"
        }
        MenuView.delegate = self
        MenuView.dataSource = self
        repullFromFB()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Restaurant == nil {
            print("WHAT THE FUCK")
            Restaurant = Place()
            Restaurant!.name = "ShareTea"
        }
        repullFromFB()
    }
    
    func repullFromFB() {
        RestaurantName.text  = Restaurant!.name
        restaurantname = Restaurant!.name!
        repullPlace(Restaurant!) { newres in
            self.Restaurant = newres
            
            self.RestaurantHours.text = self.FormatTime()
            self.RestaurantImage.image = UIImage(named: "placeholderRestaurant")
            self.MenuView.reloadData()
        }
        
    }
    
    func FormatAttrs(attrs: String) -> String {
        let attrnames = ["Milk", "Fruit", "Non-Dairy", "Vegan", "Hot", "Cold"]
        var final = ""
        var counter = 0
        for char in attrs {
            if char == "T" {
                final += attrnames[counter]
                if counter < (attrs.count - 1) {
                    final += ", "
                }
            }
            counter += 1
        }
        if final == "" {
            return " "
        }
        return final
    }
    func FormatPrice(price: Float) -> String {
        return String(format: "$%.02f", price)
    }
    
    func FormatTime() -> String {
        var dict: [String: [Int]] = [:]
        if Restaurant!.storeTimes.count == 0 {
            return ""
        }
        for i in 0...6 {
            for time in Restaurant!.storeTimes[i].components(separatedBy: ",") {
                if dict[time] == nil {
                    dict[time] = []
                }
                dict[time]! += [i]
            }
        }
        var final: [String] = ["","","","","","",""]
        for (key, value) in dict {
            var i = 0
            if key != "-" {
                while i < value.count {
                let endrun = endofRun(start: i, lst: value)
                    if final[value[i]] != "" {
                        final[value[i]] += ", "
                    }
                    if endrun > i {
                        final[value[i]] += dow[value[i]] + "-" + dow[value[endrun]]
                        final[value[i]] += " " + key
                        i = endrun + 1
                    } else {
                        final[value[i]] += dow[value[i]]
                        final[value[i]] += " " + key
                        i += 1
                    }
                }
            }
            
        }
        var finalstring = ""
        for i in 0...final.count - 1 {
            let date = final[i]
            if date != "" {
                finalstring += date
                if i < (final.count - 2) {
                    finalstring += "; "
                }
            }
        }
        return finalstring
    }
    
    
    func endofRun(start: Int, lst: [Int]) -> Int {
        if (start + 1 > lst.count - 1) {
            return start
        }
        for i in start + 1...lst.count - 1 {
            if lst[i] != lst[i - 1] + 1 {
                return i - 1
            }
        }
        return lst.count - 1
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "restaurant_to_add_segue" {
            if let dest = segue.destination as? AddMenuItemViewController {
                dest.place = Restaurant
                
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 

}
