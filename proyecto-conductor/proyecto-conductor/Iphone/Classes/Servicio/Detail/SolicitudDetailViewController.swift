//
//  SolicitudDetailViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 12/12/21.
//

import UIKit

class SolicitudDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
