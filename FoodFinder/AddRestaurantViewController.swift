//
//  AddRestaurantViewController.swift
//  
//
//  Created by GEGWC10 on 4/25/19.
//


////////TO DO: IMPLEMENT UIDATEPICKER and day-of-the-week buttons, hourDateTable
import UIKit

class AddRestaurantViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var placeNameText: UITextField!
    
    @IBOutlet var openingHours: UIDatePicker!
    @IBOutlet var closingHours: UIDatePicker!
    let datePicker = UIDatePicker()

        var buttonspressed = [false, false, false, false, false, false, false]
    
    @IBOutlet var monButton: UIButton!
    
    @IBAction func monButtonPressed(_ sender: Any) {
    }
    
    
    @IBOutlet var tuesButton: UIButton!
    
    
    @IBAction func tuesButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet var wedButton: UIButton!
    
    
    @IBAction func wedButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet var thursButton: UIButton!
    
    @IBAction func thursButtonPressed(_ sender: Any) {
    }
    
    
    @IBOutlet var friButton: UIButton!
    
    
    @IBAction func friButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet var satButton: UIButton!
    
    @IBAction func satButtonPressed(_ sender: Any) {
    }
    
    
    @IBOutlet var sunButton: UIButton!
    
    @IBAction func sunButtonPressed(_ sender: Any) {
    }
    
    
    @IBOutlet var addDayButton: UIButton!
    
    @IBOutlet var hourDateTable: UITableView!
    
    @IBOutlet var locationText: UITextField!
    
    @IBOutlet var finishButton: UIButton!
    
    
    
    
    
    ////Variables to use////
    var placeName: String?
    var datePicked: String?
    var locationAddress: String?
    var dictionaryTimes : [String] = ["-","-","-","-","-","-","-"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        placeNameText.delegate = self
        locationText.delegate = self;
    }
    
    //for searchbar hiding keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //hiding keyboard after typing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func nameInput(_ sender: UITextField) {
        placeName = sender.text;
    }
    
    @IBAction func locationInput(_ sender: UITextField) {
        locationAddress = sender.text
    }
    
    @IBAction func finishPressed(_ sender: UIButton) {
        let newPlace = Place(placeName!, locationAddress!, dictionaryTimes);
        addNewPlace(newPlace); //sends to firebase database
        cleanPage()
    }
    
    func cleanPage() {
        placeName = ""
        datePicked = ""
        locationAddress = ""
        var dictionaryTimes : [String] = ["-","-","-","-","-","-","-"]
    }
    
}
