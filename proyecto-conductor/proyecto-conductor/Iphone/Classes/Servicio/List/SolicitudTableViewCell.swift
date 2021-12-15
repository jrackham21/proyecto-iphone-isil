//
//  SolicitudTableViewCell.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/15/21.
//

import UIKit

class SolicitudTableViewCell: UITableViewCell{
    
    @IBOutlet private weak var lblRecojo: UILabel!
    @IBOutlet private weak var lblDestino: UILabel!
    @IBOutlet private weak var lblHora: UILabel!
    
    var objSolicitud: (cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )!
    
    func updateData(_ objSolicitud:(cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )){
        self.lblRecojo.text = objSolicitud.recojo
        self.lblDestino.text = objSolicitud.destino
        self.lblHora.text = objSolicitud.hora
    }
}

extension SolicitudTableViewCell {
    class func createInTableView(_ tableView:UITableView, indexPath: IndexPath, objSolicitud: (cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )) -> SolicitudTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SolicitudTableViewCell", for: indexPath) as? SolicitudTableViewCell
        cell?.updateData(objSolicitud)
        return cell ?? SolicitudTableViewCell()
    }
}
