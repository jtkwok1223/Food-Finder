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
    var ID : Int = 9999999 //default for non FB pulled places
    var MenuItems: [String] = []
    var MenuPrices: [Float] = []
    var MenuAttrs: [String] = [] //I GUESS JUST A STRING OF WHETHER EACH ATTR APPLIES? FFTFF
    var MenuToppings: [String] = []
    var MenuToppingPrices: [Float] = []
    var name: String?
    var locationAddress: String?
    var storeTimes: [String] = []
    var latitude: Double? = nil
    var longitude: Double? = nil
    var lon_lat: CLLocationCoordinate2D? = nil
    
    var pullData: [String: Any] = [:]
    
    //make restaurant
    init(_ pinName: String, _ pinLocationName: String,  _ times: [String]) {
        self.name = pinName
        self.locationAddress = pinLocationName
        self.storeTimes = times
        
    }
    
    //make restaurant
    init(_ id: Int, _ pinName: String, _ pinLocationName: String,  _ times: [String]) {
        self.ID = id;
        self.name = pinName
        self.locationAddress = pinLocationName
        self.storeTimes = times
        
    }
    
    //for pulling purposes: look at firebase for pulling anytime
    //init to make a easy pulling from FB --> USE pullData : [String: Any] variable!!! :)
    init(_ pullData: [String: Any]) {
        super.init()
        self.ID = pullData["ID"] as! Int
        self.name = pullData["name"] as? String
        self.locationAddress = pullData["locationAddress"] as? String
        addLatLonManually(pullData["Lat"] as! Double, pullData["Long"] as! Double)
        print(pullData["Location"])
        self.lon_lat = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        self.storeTimes = pullData["storeTimes"] as! [String]
        self.MenuItems = pullData["MenuItems"] as! [String]
        self.MenuAttrs = pullData["MenuAttrs"] as! [String]
        self.MenuPrices = pullData["MenuPrices"] as! [Float]
        self.MenuToppings = pullData["MenuToppings"] as! [String]
        self.MenuToppingPrices = pullData["MenuToppingPrices"] as! [Float]
    }
    
    override init() {
        
    }
    
    func addLatLonManually(_ lat: Double, _ long: Double) {
        self.latitude = lat
        self.longitude = long
        self.lon_lat = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
    }
    
    func addFood(_ food: Food) {
        self.MenuItems.append(food.name)
        self.MenuPrices.append(food.price)
        self.MenuAttrs.append(food.attr)
    }
    
    //add food in restaurant
}

