//
//  ServiciosViewController.swift
//  proyecto-cliente
//
//  Created by Jack Rackham on 12/15/21.
//

import UIKit

class ServiciosViewController: UIViewController {

    @IBOutlet private weak var tblServicios: UITableView!
    
    var arrayServicios: [(cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )] =
        
        [("easy@gmail.com", "Iris", "Steensma", "here", "there", "now", "Travis", "https://lamanodelextranjero.files.wordpress.com/2013/10/jodie-foster-como-la-prostituta-iris_thumb.jpg", 1),
         ("kamesenin@gmail.com", "Muten", "Roshi", "Kame House", "Capsule Corporation", "12:00", "Bulma", "https://pm1.narvii.com/6843/f91922cb75c78054420d8ab9e996cdcec90db821v2_hq.jpg", 1),
         ("roger@gmail.com", "Gol D.", "Roger", "Logue Town", "Laugh Tale", "11:00", "Rayleigh", "https://www.geekmi.news/__export/1623273715672/sites/debate/img/2021/06/09/rogergold1.jpg_778525087.jpg",1)
        ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let controller = segue.destination as? ServicioDetailViewController, let objServicio = sender as? (cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int ) {
            controller.objServicio = objServicio
        }
    }
}

extension ServiciosViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayServicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objServicio = self.arrayServicios[indexPath.row]
        return ServicioTableViewCell.createInTableView(tableView, indexPath: indexPath, objServicio: objServicio)
    }
}

extension ServiciosViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objServicio = self.arrayServicios[indexPath.row]
        self.performSegue(withIdentifier: "ServicioDetailViewController", sender: objServicio)
    }

}
