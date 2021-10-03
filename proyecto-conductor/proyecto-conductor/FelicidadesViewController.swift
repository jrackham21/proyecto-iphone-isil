//
//  FelicidadesViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 10/3/21.
//

import UIKit

class FelicidadesViewController: UIViewController {
    
    @IBAction func clickBtnIrAHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
