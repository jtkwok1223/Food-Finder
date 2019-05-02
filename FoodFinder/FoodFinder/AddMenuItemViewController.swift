//
//  AddMenuItemViewController.swift
//  Food Finder
//
//  Created by Turese Anderson on 5/1/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import UIKit

class AddMenuItemViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var milkButton: UIButton!
    
    @IBAction func milkButtonPressed(_ sender: Any) {
    }
    
    @IBAction func fruitButton(_ sender: Any) {
    }
    
    @IBAction func fruitButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet weak var dairyButton: UIButton!
    
    
    @IBAction func dairyButtonPressed(_ sender: Any) {
    }
    
    
    @IBOutlet weak var veganButton: UIButton!
    
    
    @IBAction func veganButtonPressed(_ sender: Any) {
    }
    
    
    @IBOutlet weak var hotButton: UIButton!
    
    
    @IBAction func hotButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func coldButton(_ sender: Any) {
    }
    
    
    @IBAction func coldButtonPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitButton(_ sender: Any) {
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
