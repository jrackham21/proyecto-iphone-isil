//
//  SolicitudDetailViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/12/21.
//

import UIKit
import Alamofire

class SolicitudDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var lblNombre: UILabel!
    @IBOutlet private weak var lblApellido: UILabel!
    @IBOutlet private weak var lblRecojo: UILabel!
    @IBOutlet private weak var lblDestino: UILabel!
    @IBOutlet private weak var lblHora: UILabel!
    @IBOutlet private weak var ivImagen: UIImageView!
    
    var objSolicitud: (cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateData()
    }

    // MARK: - Actions
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateData() {
        self.lblNombre.text = self.objSolicitud.nombre
        self.lblApellido.text = self.objSolicitud.apellido
        self.lblRecojo.text = self.objSolicitud.recojo
        self.lblDestino.text = self.objSolicitud.destino
        self.lblHora.text = self.objSolicitud.hora
        
        let request = AF.request(self.objSolicitud.imagen, method: .get)
               
        request.response { response in
            guard let data = response.data else { return }
            let image = UIImage(data: data)
            self.ivImagen.image = image
        }
        
    }

}
