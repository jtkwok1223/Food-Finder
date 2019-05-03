//
//  FoodPlaces.swift
//  Food Finder
//
//  Created by GEGWC10 on 4/11/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//


/////////////////////////USED TO CONNECT TO FIREBASE///////////////////////////////

import Foundation
import UIKit


var entryID = 0; //for getNextOpenIndex -> use the index -> updateNextOpenIndex
var getterID = 0;
var setterID = 0;
var allPlaces: [Place] = [];


func getNextOpenIndex() {
    let docRef = db.collection("openIndex").document("vFrXpa2LmZFxT8H9JgdP");
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            if let dataDescription = document.data() {
                entryID = dataDescription["i"] as! Int
            }
        } else {
            print("Document does not exist")
        }
    }
}

//FB FORMAT: "openIndex" -> "vFrXpa2LmZFxT8H9JgdP" -> "i" : (INT)
func updateNextOpenIndex() {
    db.collection("openIndex").document("vFrXpa2LmZFxT8H9JgdP").setData([
        "i" : entryID + 1,
    ], merge: true) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}

func findStoreID(_ place: Place) {
    let docRef = db.collection(place.name!).document(place.locationAddress!);
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            if let dataDescription = document.data() {
                getterID = dataDescription["id"] as! Int
            }
        } else {
            print("Document does not exist")
        }
    }
}

//FB FORMAT: the place's name -> the place's address -> "id" : (INT)
func storeID(_ place: Place) {
    db.collection(place.name!).document(place.locationAddress!).setData([
        "id" : setterID
    ], merge: true) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}



////////////////////// ABSTRACT FUNCTIONS ABOVE, USE BELOW ONLY ////////////////////////////////////////////////////////////////////////////////

//use this to update place with the food
func updateFoodList(_ place: Place, _ food: Food){
    findStoreID(place)
    db.collection(String(getterID)).document(":3c").setData([
        "MenuAttrs" : place.MenuAttrs,
        "MenuItems" : place.MenuItems,
        "MenuPrices" : place.MenuPrices,
        "MenuToppings" : place.MenuToppings,
        "MenuToppingPrices" : place.MenuToppingPrices
    ], merge: true) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}

//for the map and places table
func repullPlace(_ place: Place) -> Place {
    var pulledPlace = Place()
    findStoreID(place)
    let docRef = db.collection(String(getterID)).document(":3c")
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            if let dataDescription = document.data() {
                pulledPlace = Place(dataDescription)
            }
        } else {
            print("Document does not exist")
        }
    }
    return pulledPlace
}



//use this to add to firebase
func addNewPlace(_ place: Place){
    getNextOpenIndex(); //updates entryID
    db.collection(String(entryID)).document(":3c").setData([
        "ID" : entryID,
        "Name" : place.name,
        "LocationAddress" : place.locationAddress,
        "Location" : "", //to be verified ourselves
        "StoreTimes" : place.storeTimes,
    ], merge: true) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
    storeID(place)
    updateNextOpenIndex()
}


//for the map and places table
func pullAllPlaces() {
    getNextOpenIndex() //updates entryID
    let maxi = entryID - 1
    
    for i in 0...maxi {
        let docRef = db.collection(String(i)).document(":3c")
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let dataDescription = document.data() {
                    let pulledPlace = Place(dataDescription)
                    allPlaces.append(pulledPlace)
                }
            } else {
                print("Document does not exist")
            }
        }
    }
}
