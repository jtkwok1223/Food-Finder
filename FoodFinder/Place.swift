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
        self.ID = pullData["ID"] as! Int
        self.name = pullData["Name"] as? String
        self.locationAddress = pullData[""] as? String
        self.storeTimes = pullData["Name"] as! [String]
        self.pullData = pullData
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
        var listIterate: [Bool] = []
        listIterate.append(food.attr.milkTea)
        listIterate.append(food.attr.fruitTea)
        listIterate.append(food.attr.dairyFree)
        listIterate.append(food.attr.veganOption)
        listIterate.append(food.attr.hot)
        listIterate.append(food.attr.cold)
        
        var booleanStr = ""
        for i in listIterate {
            if (i) {
                booleanStr += "T"
            } else {
                booleanStr += "F"
            }
        }
        self.MenuAttrs.append(booleanStr)
    }
    
    //add food in restaurant
}

