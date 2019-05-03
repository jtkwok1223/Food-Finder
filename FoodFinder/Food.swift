//
//  Food.swift
//  Food Finder
//
//  Created by GEGWC10 on 4/18/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

class Food {
    var name: String
    var price: Float
    var attr: Attributes
    //var picString: String
    
    //make food
    init? (_ nameFood: String, _ priceFood: Float, _ attributesFood: Attributes) {
        self.name = nameFood
        self.price = priceFood
        self.attr = attributesFood
        //self.picString = picFood
    }
}


