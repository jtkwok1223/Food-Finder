//
//  Post.swift
//  Food Finder
//
//  Created by GEGWC10 on 4/11/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Place: NSObject {
    var name: String
    var locationAddress: String
    var lon_lat: CLLocationCoordinate2D
    
    var userName: String!
    var picName: String!
    var picture: UIImage!
    var timeStamp: Date! = Date.init()
    var ratings: Int!
    
    init(_ pinName: String, _ pinLocationName: String, _ coords: CLLocationCoordinate2D, _ name: String) { //_ user: User,
        self.name = pinName
        self.locationAddress = pinLocationName
        self.lon_lat = coords
        
        self.userName = name
    }
    
   func makeEntry(_ timer: Date, _ picname: String, _ rating: Int) {
    self.timeStamp = timer
    self.picName = picname
    self.ratings = rating
    }
}

