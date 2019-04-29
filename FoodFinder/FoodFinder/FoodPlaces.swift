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

var entryID = 0

//use this to add to firebase
func addNewPlace(_ place: Place){
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
    entryID += 1
}
