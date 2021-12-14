//
//  Servicio.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/13/21.
//

import Foundation
import FirebaseFirestore

struct Servicio {
    let id: String
    let recojo: String
    let destino: String
    let hora: String
    let cliente: String
    let conductor: String
    let estado: Int
}

extension Servicio{
    static func build(from documents: [QueryDocumentSnapshot]) -> [Servicio] {
        var servicios = [Servicio]()
        for document in documents {
            servicios.append(Servicio(id: document["id"] as? String ?? "", recojo: document["recojo"] as? String ?? "", destino: document["destino"] as? String ?? "", hora: document["hora"] as? String ?? "", cliente: document["cliente"] as? String ?? "", conductor: document["conductor"] as? String ?? "", estado: document["estado"] as? Int ?? 0))
        }
        return servicios
    }
}

