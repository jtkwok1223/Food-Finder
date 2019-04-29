//
//  ViewRestaurantViewController.swift
//  Food Finder
//
//  Created by Turese Anderson on 4/28/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import UIKit

class MenuItemViewCell: UITableViewCell {
    
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
    
    @IBOutlet weak var RestaurantName: UILabel!
    
    @IBOutlet weak var RestaurantHours: UILabel!
    
    @IBOutlet weak var RestaurantImage: UIImageView!
    
    @IBOutlet weak var MenuView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell") as? MenuItemViewCell {
            cell.MenuItemName.text = "TEST"
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuView.delegate = self
        MenuView.dataSource = self
        
        
        // Do any additional setup after loading the view.
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
