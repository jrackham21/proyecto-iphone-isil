//
//  SplashViewController.swift
//  proyecto-cliente
//
//  Created by user191544 on 10/3/21.
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
