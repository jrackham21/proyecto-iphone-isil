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
    
    let db = Firestore.firestore()
    
    var arrayServicios: [(cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int )] =
        
        [("easy@gmail.com", "Iris", "Steensma", "here", "there", "now", "Travis", "https://lamanodelextranjero.files.wordpress.com/2013/10/jodie-foster-como-la-prostituta-iris_thumb.jpg", 1),
         ("kamesenin@gmail.com", "Muten", "Roshi", "Kame House", "Capsule Corporation", "12:00", "Bulma", "https://pm1.narvii.com/6843/f91922cb75c78054420d8ab9e996cdcec90db821v2_hq.jpg", 1),
         ("roger@gmail.com", "Gol D.", "Roger", "Logue Town", "Laugh Tale", "11:00", "Rayleigh", "https://www.geekmi.news/__export/1623273715672/sites/debate/img/2021/06/09/rogergold1.jpg_778525087.jpg",1)
        ]
    
    func algo() {
        print("aqui nomas saludando")
        db.collection("servicios").getDocuments { (snapshot, err) in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.algo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let controller = segue.destination as? ServicioDetailViewController, let objServicio = sender as? (cliente: String, nombre: String, apellido: String, recojo: String, destino: String, hora: String, conductor: String, imagen: String, estado: Int ) {
            controller.objServicio = objServicio
        }
    }
}

extension ServicioPorEjecutarViewController: UITableViewDataSource{    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayServicios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let objServicio = self.arrayServicios[indexPath.row]
        self.algo()
        return ServicioTableViewCell.createInTableView(tableView, indexPath: indexPath, objServicio: objServicio)
    }
}

extension ServicioPorEjecutarViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objServicio = self.arrayServicios[indexPath.row]
        self.performSegue(withIdentifier: "ServicioDetailViewController", sender: objServicio)
    }
    
}
