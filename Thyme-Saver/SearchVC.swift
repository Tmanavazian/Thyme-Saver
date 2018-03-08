//
//  SearchVC.swift
//  Thyme-Saver
//
//  Created by Theo Manavazian on 3/4/18.
//  Copyright © 2018 Theo Manavazian. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var testButton: UIButton!
    
    var circle = UIImage(named: "selectCircle")
    var filledCircle = UIImage(named: "filledCircle")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func testButton(_ sender: UIButton) {
        if(testButton.currentImage == circle){
            testButton.setImage(filledCircle, for: UIControlState.normal)
        }else {
            testButton.setImage(circle, for: UIControlState.normal)
        }


    }
}
