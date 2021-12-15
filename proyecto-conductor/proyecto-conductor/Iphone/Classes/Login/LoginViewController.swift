//
//  LoginViewController.swift
//  proyecto-conductor
//
//  Created by Jack Rackham on 10/2/21.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tfCorreo: UITextField!
    @IBOutlet weak var tfClave: UITextField!
    @IBOutlet weak var swichtRecordar: UISwitch!
    
    private let emailKey = "emailUserSigned"
    private let storage = UserDefaults.standard
    var email:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swichtRecordar.onTintColor = UIColor.systemIndigo
        if let storedEmail = storage.string(forKey: emailKey){
            tfCorreo.text = storedEmail
            swichtRecordar.isOn = true
        }else{
            swichtRecordar.isOn = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let controller = segue.destination as? PerfilViewController, let email = sender as? String {
            controller.email = email
        }
        
    }
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func clickBtnIngresar(_ sender: Any) {
        if let email = tfCorreo.text, let password = tfClave.text{
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    if self.swichtRecordar.isOn {
                        self.storage.setValue(email, forKey: "emailUserSigned")
                    }else{
                        self.storage.removeObject(forKey: self.emailKey)
                    }
                    self.performSegue(withIdentifier: "TabBarViewController", sender: email)
                }else{
                    self.showAlertMessage(title: "Error", mensaje: error!.localizedDescription)
                }
            }
        }
    }
    
    fileprivate func showAlertMessage(title:String, mensaje: String) {
        let alertController = UIAlertController(title: title, message:mensaje, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !swichtRecordar.isOn {
            tfCorreo.text?.removeAll()
        }
        tfClave.text?.removeAll()
        self.unregisterKeyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerKeyboardNotification()
    }
}

extension LoginViewController{
    private func registerKeyboardNotification(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
            
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func unregisterKeyboardNotification(){
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification){
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let viewContentFinalPosY = self.viewContent.frame.origin.y + self.viewContent.frame.height
      
        if keyboardFrame.origin.y < viewContentFinalPosY {
            
            UIView.animate(withDuration: animationDuration) {
                let delta = keyboardFrame.origin.y - viewContentFinalPosY - 5
                self.bottomConstraint.constant = delta
                self.view.layoutIfNeeded()
            }
        }
         
    }
    
    @objc func keyboardWillHide(_ notification: Notification){
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.bottomConstraint.constant = 0
            self.view.layoutIfNeeded()
         }
     }
}
