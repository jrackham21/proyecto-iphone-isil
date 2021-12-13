//
//  CorreoRecuperacionViewController.swift
//  proyecto-cliente
//
//  Created by Jack Rackham on 10/3/21.
//

import UIKit
import Firebase

class CorreoRecuperacionViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tfCorreo: UITextField!

    @IBAction func clickCloseKeyboard(_ sender: Any){
        self.view.endEditing(true)
    }
    
    @IBAction func clickBtnEnviarCorreo(_ sender: Any) {
        
        if let correo = tfCorreo.text, !correo.isEmpty{
            Auth.auth().sendPasswordReset(withEmail: correo) { (error) in
                if let error = error {
                    self.showAlertMessage(title: "Error", mensaje: error.localizedDescription)
                }else{
                    let alertController = UIAlertController(title: "Recuperacion de contraseña", message:"TSe envio un enlace a \(correo)", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { (UIAlertAction) in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }else{
            self.showAlertMessage(title: "Error", mensaje:"Ingresa un correo valido")
        }
    }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    fileprivate func showAlertMessage(title:String, mensaje: String) {
        let alertController = UIAlertController(title: title, message:mensaje, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
