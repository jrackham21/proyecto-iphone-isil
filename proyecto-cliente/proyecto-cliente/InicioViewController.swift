//
//  InicioViewController.swift
//  proyecto-cliente
//
//  Created by Jack Rackham on 10/4/21.
//

import UIKit

class InicioViewController: UIViewController {

    @IBAction func clickBtnCerrarSesion(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
