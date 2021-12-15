//
//  ServicioTableViewCell.swift
//  proyecto-cliente
//
//  Created by Jack Rackham on 12/15/21.
//

import UIKit

class ServicioTableViewCell: UITableViewCell{
    
    @IBOutlet private weak var lblLugarRecojo: UILabel!
    @IBOutlet private weak var lblLugarDestino: UILabel!
    @IBOutlet private weak var lblHoraRecojo: UILabel!
    
    var objServicio: (cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )!
    
    func updateData(_ objServicio:(cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )){
        self.lblLugarRecojo.text = objServicio.recojo
        self.lblLugarDestino.text = objServicio.destino
        self.lblHoraRecojo.text = objServicio.hora
    }
}

extension ServicioTableViewCell {
    class func createInTableView(_ tableView:UITableView, indexPath: IndexPath, objServicio: (cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )) -> ServicioTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicioTableViewCell", for: indexPath) as? ServicioTableViewCell
        cell?.updateData(objServicio)
        return cell ?? ServicioTableViewCell()
    }
}
