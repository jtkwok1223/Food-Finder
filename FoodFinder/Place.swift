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
    var MenuItems: [String] = []
    var MenuPrices: [Float] = []
    var MenuAttrs: [String] = [] //I GUESS JUST A STRING OF WHETHER EACH ATTR APPLIES?
    var MenuToppings: [String] = []
    var MenuToppingPrices: [Float] = []
    var name: String?
    var locationAddress: String?
    var storeTimes: [String:String] = [:]
    var latitude: Double? = nil
    var longitude: Double? = nil
    var lon_lat: CLLocationCoordinate2D? = nil
    
    //make restaurant
    init(_ pinName: String, _ pinLocationName: String, _ times: [String:String]) {
        self.name = pinName
        self.locationAddress = pinLocationName
        self.storeTimes = times
        
    }
    
    func addLatLonManually(_ lat: Double, _ long: Double) {
        self.latitude = lat
        self.longitude = long
        self.lon_lat = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
    }
    
    //add food in restaurant
}

