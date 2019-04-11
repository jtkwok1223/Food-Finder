//
//  Post.swift
//  Food Finder
//
//  Created by GEGWC10 on 4/11/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import Foundation
import UIKit

class Place {
    //var placeName: User;
    var userName: String!
    var picName: String!
    var picture: UIImage!
    var timeStamp: Date! = Date.init()
    var ratings: Int!
    
    init(_ name: String, _ timer: Date, _ picname: String, _ rating: Int) { //_ user: User,
        //self.placeName = user
        self.userName = name
        self.timeStamp = timer
        self.picName = picname
        self.ratings = rating
    }
}

