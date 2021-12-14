//
//  ServiciosWS.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/13/21.
//

import Foundation
import Alamofire
import FirebaseFirestore

struct ServiciosWS {
    let db = Firestore.firestore()
    
    func getServiciosPorEjecutar(completionHandler: @escaping HandlerArrayServicio) {
        
        db.collection("servicios").addSnapshotListener { querySnapshot, err in
            if let error = err {
                print(error)
                completionHandler([])
            } else {
                completionHandler(Servicio.build(from: querySnapshot?.documents ?? []))
            }
        }
    }
}
