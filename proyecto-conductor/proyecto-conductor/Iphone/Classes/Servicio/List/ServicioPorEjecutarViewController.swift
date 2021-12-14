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
    
    
}

extension ServicioPorEjecutarViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicioTableViewCell", for: indexPath)
        return cell
        
    }
    
    
}
