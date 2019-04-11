//
//  FoodPlaces.swift
//  Food Finder
//
//  Created by GEGWC10 on 4/11/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

var placeData: [String: Place] = [:]

func addNewPlace(_ placeName: String, _ place: Place){
    placeData[placeName] = place
    
    db.collection(placeName).document(place.userName).setData([
        "userName" : place.userName,
        "picName" : place.picName,
        "timeStamp" : place.timeStamp,
        "ratings" : place.ratings
    ], merge: true) { err in
        if let err = err {
            print("Error writing document: \(err)")
        } else {
            print("Document successfully written!")
        }
    }
}
