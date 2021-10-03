//
//  SplashViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 10/2/21.
//

import UIKit

class SplashViewController: UIViewController {

    @IBAction func swipeRight(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeViewController", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
