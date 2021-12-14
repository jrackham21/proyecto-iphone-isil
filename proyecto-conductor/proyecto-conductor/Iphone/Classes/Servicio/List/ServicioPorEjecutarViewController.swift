//
//  ServicioPorEjecutarViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/5/21.
//

import UIKit
import FirebaseFirestore

class ServicioPorEjecutarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private weak var tblServicios: UITableView!
    @IBOutlet private weak var lblLugarRecojo: UILabel!
    @IBOutlet private weak var lblLugarDestino: UILabel!
    @IBOutlet private weak var lblHoraRecojo: UILabel!
    
    
    private let db = Firestore.firestore()

    private var service: ServiciosWS?
    private var serviciosList = [Servicio]() {
        didSet {
            DispatchQueue.main.async {
                self.servicios = self.serviciosList
            }
        }
    }
    
    var servicios = [Servicio]() {
        didSet {
            DispatchQueue.main.async {
                self.tblServicios.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tblServicios.dataSource = self
        tblServicios.delegate = self
    }
    
    func setupTableView() {
        tblServicios.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tblServicios.allowsSelection = true
        tblServicios.isUserInteractionEnabled = true
        tblServicios.translatesAutoresizingMaskIntoConstraints = false
        tblServicios.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tblServicios.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tblServicios.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tblServicios.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
    
    func loadData() {
        service = ServiciosWS()
        service?.getServiciosPorEjecutar(completionHandler: { (servicios) in
            self.serviciosList = servicios
        })
    }
        
    func goToDetailServicio(_ objServicio: Servicio) {
        self.performSegue(withIdentifier: "ServicioDetailViewController", sender: objServicio)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicios.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        self.lblLugarRecojo.text = servicios[indexPath.row].recojo
        self.lblLugarDestino.text = servicios[indexPath.row].destino
        self.lblHoraRecojo.text = servicios[indexPath.row].hora
        
    }
}
