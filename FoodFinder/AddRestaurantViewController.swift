//
//  AddRestaurantViewController.swift
//  
//
//  Created by GEGWC10 on 4/25/19.
//


////////TO DO: IMPLEMENT UIDATEPICKER and day-of-the-week buttons, hourDateTable
import UIKit

class AddRestaurantViewController: UIViewController {
    @IBOutlet var placeNameText: UITextField!
    
    @IBOutlet var openingHours: UIDatePicker!
    @IBOutlet var closingHours: UIDatePicker!
    let datePicker = UIDatePicker()

    @IBOutlet var monButton: UIButton!
    @IBOutlet var tuesButton: UIButton!
    @IBOutlet var wedButton: UIButton!
    @IBOutlet var thursButton: UIButton!
    @IBOutlet var friButton: UIButton!
    @IBOutlet var satButton: UIButton!
    @IBOutlet var sunButton: UIButton!
    @IBOutlet var addDayButton: UIButton!
    
    @IBOutlet var hourDateTable: UITableView!
    
    @IBOutlet var locationText: UITextField!
    
    @IBOutlet var finishButton: UIButton!
    
    
    
    
    
    ////Variables to use////
    var placeName: String?
    var datePicked: String?
    var locationAddress: String?
    var dictionaryTimes : [String:String?] = ["Mon":nil, "Tues": nil, "Wed":nil, "Thurs":nil, "Fri":nil, "Sat":nil, "Sun":nil]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nameInput(_ sender: UITextField) {
        placeName = sender.text;
    }
    
    @IBAction func locationInput(_ sender: UITextField) {
        locationAddress = sender.text
    }
    
    @IBAction func finishPressed(_ sender: UIButton) {
        let newPlace = Place(placeName!, locationAddress!, dictionaryTimes as! [String : String]);
        addNewPlace(newPlace); //sends to firebase database
        cleanPage()
    }
    
    func cleanPage() {
        placeName = ""
        datePicked = ""
        locationAddress = ""
        dictionaryTimes = ["Mon":nil, "Tues": nil, "Wed":nil, "Thurs":nil, "Fri":nil, "Sat":nil, "Sun":nil]
    }
    
}
