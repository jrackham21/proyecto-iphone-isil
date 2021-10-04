//
//  CorreoRecuperacionViewController.swift
//  proyecto-cliente
//
//  Created by Jack Rackham on 10/3/21.
//

import UIKit

class CorreoRecuperacionViewController: UIViewController {

    @IBAction func clickCloseKeyboard(_ sender: Any){
        self.view.endEditing(true)
    }
    
    @IBAction func clickBtnEnviarCorreo(_ sender: Any) {
        self.performSegue(withIdentifier: "NuevaContrasenaViewController", sender: nil)
    }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
