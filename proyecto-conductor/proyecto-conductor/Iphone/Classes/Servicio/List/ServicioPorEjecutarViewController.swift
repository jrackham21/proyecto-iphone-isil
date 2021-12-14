//
//  ServicioPorEjecutarViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/5/21.
//

import UIKit
import FirebaseFirestore

class ServicioPorEjecutarViewController: UIViewController {
    
    @IBOutlet private weak var tblServicios: UITableView!
    
    var arrayServicios = ["sdaf", "234", "vdf", "sadf", "fq3t5", "fd34vd"]
}

extension ServicioPorEjecutarViewController: UITableViewDataSource{    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayServicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objServicio = self.arrayServicios[indexPath.row]
        return ServicioTableViewCell.createInTableView(tableView, indexPath: indexPath, objServicio: objServicio)
    }
}

extension ServicioPorEjecutarViewController: UITableViewDelegate{
    
}
