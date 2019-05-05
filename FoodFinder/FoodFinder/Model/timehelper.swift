//
//  timehelper.swift
//  Food Finder
//
//  Created by Turese Anderson on 5/4/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import Foundation


let dow = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]

func timesCreateNew(times: [[String : [Int]]]) -> [String] {
    var timeset = ["","","","","","",""]
    for entry in times {
        for key in entry.keys {
            for val in entry[key]! {
                if timeset[val] != "" {
                    timeset[val] += ","
                }
                timeset[val] += key
            }
        }
    }
    for i in 0...timeset.count - 1 {
        if timeset[i] == "" {
            timeset[i] = "-"
        }
    }
    return timeset
}
