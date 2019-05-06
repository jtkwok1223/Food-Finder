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
    let docRef = db.collection("0").document(place.name!);
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            if let dataDescription = document.data() {
                
                getterID = dataDescription["ID"] as! Int
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
func updateFoodList(_ place: Place){
    findStoreID(place)
    db.collection("0").document(place.name!).setData([
        "MenuAttrs" : place.MenuAttrs,
        "MenuItems" : place.MenuItems,
        "MenuPrices" : place.MenuPrices,
        "MenuToppings" : place.MenuToppings,
        "MenuToppingPrices" : place.MenuToppingPrices,
    ], merge: true) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}



//for the map and places table
func repullPlace(_ place: Place, completion: @escaping (Place) -> Void){
    findStoreID(place)
    var newplace = Place()
    let docRef = db.collection("0").document(place.name!)
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            if let dataDescription = document.data() {
                newplace = Place(dataDescription)
            } else {
                print("error here")
            }
        } else {
            print("Document does not exist")
        }
        completion(newplace)
    }
}



//use this to add to firebase
func addNewPlace(_ place: Place){
    getNextOpenIndex() //updates entryID
    db.collection("0").document(place.name!).setData([
        "ID" : entryID,
        "name" : place.name!,
        "locationAddress" : place.locationAddress!,
        "Location" : "", //to be verified ourselves
        "storeTimes" : place.storeTimes,
        "MenuItems" : [],
        "MenuPrices" : [],
        "MenuAttrs" : [],
        "MenuToppings" : [],
        "MenuToppingPrices" : [],
        "Long" : 0,
        "Lat" : 0
        //"ID" : getNextOpenIndex()
        
        
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
func pullAllPlaces(completion: @escaping ([Place]) -> Void) {
    getNextOpenIndex() //updates entryID
    let colRef = db.collection("0")
    colRef.getDocuments() { (querySnapshot, err) in
        var allplaces: [Place] = []
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                let dataDescription = document.data()
                let pulledPlace = Place(dataDescription)
                allplaces.append(pulledPlace)
            }
        }
        completion(allplaces)
    }
    
}
