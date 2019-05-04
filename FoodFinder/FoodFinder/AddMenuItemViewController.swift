//
//  AddMenuItemViewController.swift
//  Food Finder
//
//  Created by Turese Anderson on 5/1/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import UIKit

class AddMenuItemViewController: UIViewController {
    
    var place : Place!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var milkButton: UIButton!
    
    @IBAction func milkButtonPressed(_ sender: UIButton) {
        ismilk = !ismilk
        setpressedcolor(button: sender, pressed: ismilk)
    }
    
    @IBAction func fruitButton(_ sender: Any) {
    }
    
    @IBAction func fruitButtonPressed(_ sender: UIButton) {
        isfruit = !isfruit
        setpressedcolor(button: sender, pressed: isfruit)
    }
    
    @IBOutlet weak var dairyButton: UIButton!
    
    
    @IBAction func dairyButtonPressed(_ sender: UIButton) {
        isdairyfree = !isdairyfree
        setpressedcolor(button: sender, pressed: isdairyfree)
    }
    
    
    @IBOutlet weak var veganButton: UIButton!
    
    
    @IBAction func veganButtonPressed(_ sender: UIButton) {
        isvegan = !isvegan
        setpressedcolor(button: sender, pressed: isvegan)
    }
    
    
    @IBOutlet weak var hotButton: UIButton!
    
    
    @IBAction func hotButtonPressed(_ sender: UIButton) {
        ishot = !ishot
        setpressedcolor(button: sender, pressed: ishot)
    }
    
    
    @IBAction func coldButton(_ sender: Any) {
        
    }
    
    
    @IBAction func coldButtonPressed(_ sender: UIButton) {
        iscold = !iscold
        setpressedcolor(button: sender, pressed: iscold)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var ismilk = false
    var isfruit = false
    var isdairyfree = false
    var isvegan = false
    var ishot = false
    var iscold = false
    
    
    
    
    @IBAction func SubmitButton(_ sender: Any) {
        let addFood = Food(nameText.text ?? "", (priceText.text! as NSString).floatValue, Attributes(ismilk, isfruit, isdairyfree, isvegan, isvegan, iscold))!
        updateFoodList(place, addFood)
        let alertView = UIAlertController(title: "Item Added.", message: "Menu item has been added.", preferredStyle: .actionSheet)
        
        
        let okAction = UIAlertAction (title: "Ok", style: .destructive )
        { alertAction in
            self.performSegue(withIdentifier: "unwind_added_item", sender: self)
        }
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
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
