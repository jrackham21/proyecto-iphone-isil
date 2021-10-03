//
//  NuevaContrasenaViewController.swift
//  proyecto-cliente
//
//  Created by Jack Rackham on 9/30/21.
//

import UIKit

class NuevaContrasenaViewController: UIViewController {

    @IBAction func clickCloseKeyboard(_ sender: Any){
        self.view.endEditing(true)
    }
    
    @IBAction func blickBtnRestablecer(_ sender: Any) {
        self.performSegue(withIdentifier: "FelicidadesViewController", sender: nil)
    }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
