//
//  Attributes.swift
//  Food Finder
//
//  Created by GEGWC10 on 4/18/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import Foundation

class Attributes {
    var milkTea: Bool
    var fruitTea: Bool
    var dairyFree:Bool
    var veganOption: Bool
    var hot: Bool
    var cold: Bool
    
    init(_ mt: Bool, _ ft: Bool, _ df: Bool, _ vo: Bool, _ h: Bool, _ c: Bool) {
        self.milkTea = mt
        self.fruitTea = ft
        self.dairyFree = df
        self.veganOption = vo
        self.hot = h
        self.cold = c
    }
}
