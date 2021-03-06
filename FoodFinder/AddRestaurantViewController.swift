//
//  AddRestaurantViewController.swift
//  
//
//  Created by GEGWC10 on 4/25/19.
//


////////TO DO: IMPLEMENT UIDATEPICKER and day-of-the-week buttons, hourDateTable
import UIKit

class timeViewCell: UITableViewCell {
    
    
    @IBOutlet weak var timeEntry: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

class AddRestaurantViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var times: [[String : [Int]]] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "time_view_cell") as? timeViewCell {
            let entry = times[indexPath.row]
            var strgen = ""
            for key in entry.keys {
                for val in entry[key]! {
                    strgen += dow[val] + " "
                }
                strgen += key
            }
            cell.timeEntry.text = strgen
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        times.remove(at: indexPath.row)
        hourDateTable.reloadData()
    }
    
    
    @IBOutlet var placeNameText: UITextField!
    
    @IBOutlet var openingHours: UIDatePicker!
    @IBOutlet var closingHours: UIDatePicker!
    let datePicker = UIDatePicker()

    
    var buttonspressed = [false, false, false, false, false, false, false]
    
    
    @IBOutlet var monButton: UIButton!
    
    @IBAction func monButtonPressed(_ sender: Any) {
        buttonspressed[0] = !buttonspressed[0]
        setpressedcolor(button: monButton, pressed: buttonspressed[0])
    }
    
    @IBOutlet var tuesButton: UIButton!
    
    
    @IBAction func tuesButtonPressed(_ sender: Any) {
        buttonspressed[1] = !buttonspressed[1]
        setpressedcolor(button: tuesButton, pressed: buttonspressed[1])
    }
    
    @IBOutlet var wedButton: UIButton!
    
    
    @IBAction func wedButtonPressed(_ sender: Any) {
        buttonspressed[2] = !buttonspressed[2]
        setpressedcolor(button: wedButton, pressed: buttonspressed[2])
    }
    
    @IBOutlet var thursButton: UIButton!
    
    @IBAction func thursButtonPressed(_ sender: Any) {
        buttonspressed[3] = !buttonspressed[3]
        setpressedcolor(button: thursButton, pressed: buttonspressed[3])
    }
    
    
    @IBOutlet var friButton: UIButton!
    
    
    @IBAction func friButtonPressed(_ sender: Any) {
        buttonspressed[4] = !buttonspressed[4]
        setpressedcolor(button: friButton, pressed: buttonspressed[4])
    }
    
    @IBOutlet var satButton: UIButton!
    
    @IBAction func satButtonPressed(_ sender: Any) {
        buttonspressed[5] = !buttonspressed[5]
        setpressedcolor(button: satButton, pressed: buttonspressed[5])
    }
    
    
    @IBOutlet var sunButton: UIButton!
    
    @IBAction func sunButtonPressed(_ sender: Any) {
        buttonspressed[6] = !buttonspressed[6]
        setpressedcolor(button: sunButton, pressed: buttonspressed[6])
    }
    
    
    @IBOutlet var addDayButton: UIButton!
    
    
    @IBAction func addDayPressed(_ sender: Any) {
        //var times: [[String : [Int]]] = []
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "h:mm a"
        
        let open = dateformatter.string(from: openingHours!.date)
        let close = dateformatter.string(from: closingHours!.date)
        
        var days: [Int] = []
        for i in  0...buttonspressed.count - 1 {
            if buttonspressed[i] {
                days += [i]
            }
        }
        
        times += [[open + "-" + close : days]]
        hourDateTable.reloadData()
    }
    
    
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
        locationText.delegate = self
        
        hourDateTable.delegate = self
        hourDateTable.dataSource = self
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
        
        
        dictionaryTimes = timesCreateNew(times: times)
        //print(dictionaryTimes)
        //print(placeName ?? "")
        //print(locationAddress ?? "")
        if locationAddress == nil {
            print("NIL LOCATION")
            locationAddress = "-"
        }
        if placeName == nil {
            print("NIL NAME")
            placeName = "-"
        }
        let newPlace = Place(placeName!, locationAddress!, dictionaryTimes);
        
        
        addNewPlace(newPlace); //sends to firebase database
        cleanPage()
        
        let alert = UIAlertController(title: "Your new restaurant is under review", message: "", preferredStyle: UIAlertController.Style.alert)
        let postAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in self.finishButton
        }
        alert.addAction(postAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func cleanPage() {
        placeName = ""
        datePicked = ""
        locationAddress = ""
        dictionaryTimes = ["-","-","-","-","-","-","-"]
        times = []
        hourDateTable.reloadData()
    }
    
}
