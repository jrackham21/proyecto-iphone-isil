//
//  ServicioTableViewCell.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/5/21.
//

import UIKit

class ServicioTableViewCell: UITableViewCell{    
    
    @IBOutlet private weak var lblLugarRecojo: UILabel!
    @IBOutlet private weak var lblLugarDestino: UILabel!
    @IBOutlet private weak var lblHoraRecojo: UILabel!
    
    var objServicio: String!
    
    func updateData(_ objServicio:String){
        self.lblHoraRecojo.text = objServicio
    }
}

extension ServicioTableViewCell {
    class func createInTableView(_ tableView:UITableView, indexPath: IndexPath, objServicio:String) -> ServicioTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicioTableViewCell", for: indexPath) as? ServicioTableViewCell
        cell?.updateData(objServicio)
        return cell ?? ServicioTableViewCell()
    }
}


