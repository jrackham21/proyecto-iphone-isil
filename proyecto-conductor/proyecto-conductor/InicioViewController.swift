//
//  InicioViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 10/4/21.
//

import UIKit

class InicioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickCerrarSesion(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
 

}
