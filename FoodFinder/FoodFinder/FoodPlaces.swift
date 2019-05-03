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


var entryID = 0; //default but will update
var getterID = 0;
var setterID = 0;

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



//use this to add to firebase
func addNewPlace(_ place: Place){
    getNextOpenIndex(); //updates entryID
    db.collection(String(entryID)).document(place.name!).setData([
        "name" : place.name,
        "locationAddress" : place.locationAddress,
        "storeTimes" : place.storeTimes
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

func pullPlace(_ place: Place) {
    findStoreID(place) //gets setterID for the store
    let docRef = db.collection(String(setterID)).document(place.name!)
    
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            if let dataDescription = document.data() {
                print(dataDescription)
            }
        } else {
            print("Document does not exist")
        }
    }
}
