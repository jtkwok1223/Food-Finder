//
//  User.swift
//  Food Finder
//
//  Created by GEGWC10 on 4/11/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

class User{
    var userName: String!
    var picName: String!
    var picture: UIImage!
    
    init(_ name: String, _ picname: String) {
        self.userName = name
        self.picName = picname
    }
}

