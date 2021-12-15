//
//  ServicioDetailViewController.swift
//  proyecto-cliente
//
//  Created by user191544 on 12/15/21.
//


import UIKit
import Alamofire

class ServicioDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var lblNombre: UILabel!
    @IBOutlet private weak var lblApellido: UILabel!
    @IBOutlet private weak var lblRecojo: UILabel!
    @IBOutlet private weak var lblDestino: UILabel!
    @IBOutlet private weak var lblHora: UILabel!
    @IBOutlet private weak var ivImagen: UIImageView!
    
    var objServicio: (cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateData()
    }

    // MARK: - Actions
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateData() {
        self.lblNombre.text = self.objServicio.nombre
        self.lblApellido.text = self.objServicio.apellido
        self.lblRecojo.text = self.objServicio.recojo
        self.lblDestino.text = self.objServicio.destino
        self.lblHora.text = self.objServicio.hora
        
        let request = AF.request(self.objServicio.imagen, method: .get)
               
        request.response { response in
            guard let data = response.data else { return }
            let image = UIImage(data: data)
            self.ivImagen.image = image
        }
        
    }
    
}
