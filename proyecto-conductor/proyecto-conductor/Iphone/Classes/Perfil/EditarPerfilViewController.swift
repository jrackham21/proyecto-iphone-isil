//
//  EditarPerfilViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/5/21.
//

import UIKit

class EditarPerfilViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tfTelefono: UITextField!
    @IBOutlet weak var imgPerfil: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tomarFoto(_ sender: Any){
        
    }
    
    @IBAction func subirFoto(_ sender: Any){
        
    }
    
    @IBAction func guardar(_ sender: Any){
        // TODO
        self.navigationController?.popViewController(animated: true)
    }

}
