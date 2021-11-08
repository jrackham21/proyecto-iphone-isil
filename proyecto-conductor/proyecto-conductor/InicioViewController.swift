//
//  InicioViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 10/4/21.
//

import UIKit
import FirebaseAuth

class InicioViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var lbMensaje: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickCerrarSesion(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.navigationController?.popViewController(animated: true)
        } catch {
            let alertController = UIAlertController(title: "Error", message:"No se pudo cerrar sesion", preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
