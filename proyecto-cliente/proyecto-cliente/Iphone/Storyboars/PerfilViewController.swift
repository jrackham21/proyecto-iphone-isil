//
//  PerfilViewController.swift
//  proyecto-cliente
//
//  Created by user191544 on 12/13/21.
//

import UIKit
import FirebaseAuth

class PerfilViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var lblNombreCompleto: UILabel!
    @IBOutlet weak var lblTelefono: UILabel!
    @IBOutlet weak var lblCorreo: UILabel!
    @IBOutlet weak var imgPerfil: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Actions
    @IBAction func goToEditPerfil(_ sender:Any){
        self.performSegue(withIdentifier: "EditarPerfilViewController", sender: nil)
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
