//
//  ViewController.swift
//  Food Finder
//
//  Created by Jennifer Kwok on 3/20/19.
//  Copyright © 2019 iOSDecal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
        
        //This is supposed to make a gradient background but it isn't quite working^^
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

