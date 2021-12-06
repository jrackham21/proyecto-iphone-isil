//
//  RegistroViewController.swift
//  proyecto-cliente
//
//  Created by Jack Rackham on 9/29/21.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class RegistroViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    @IBOutlet weak var tfNombres: UITextField!
    @IBOutlet weak var tfApellidos: UITextField!
    @IBOutlet weak var tfTelefono: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    @IBOutlet weak var tfClave: UITextField!
    @IBOutlet weak var tfClaveConf: UITextField!
    @IBOutlet weak var swichtTerm: UISwitch!
    @IBOutlet weak var imgPerfil: UIImageView!
    
    private var imagePicker: UIImagePickerController?
    
    private let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swichtTerm.isOn = false
        swichtTerm.onTintColor = UIColor.systemIndigo
    }
       
    @IBAction func clickCloseKeyboard(_ sender: Any){
        self.view.endEditing(true)
    }
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clickBtnAcceder(_ sender: Any) {
        //TODO
        self.navigationController?.popViewController(animated: true)
    }
   
    @IBAction func clickBtnRegistrame(_ sender: Any) {
        
        let nombres = tfNombres.text
        let apellidos = tfApellidos.text
        let telefono = tfTelefono.text
        
        if nombres!.isEmpty || apellidos!.isEmpty || telefono!.isEmpty{
            self.showAlertMessage(title: "Error", mensaje:"Todos los campos deben ser llenados")
        }else if tfClave.text != tfClaveConf.text {
            self.showAlertMessage(title: "Error", mensaje:"Las contraseñas no coinciden")
        }else if !swichtTerm.isOn{
            self.showAlertMessage(title: "Error", mensaje:"Debe aceptar los terminos y condiciones")
        }else{
            if let email = tfCorreo.text,
               let password = tfClave.text,
               let nombres = tfNombres.text,
               let apellidos = tfApellidos.text,
               let telefono = tfTelefono.text{
                Auth.auth().createUser(withEmail: email, password: password) { (result,     error) in
                    if error == nil {
                        self.subirFotoAFirebase()
                        let alertController = UIAlertController(title: "Registro exitoso",  message:"Tu cuenta se ha registrado exitosamente",  preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Aceptar", style:    .default, handler: { (UIAlertAction) in
                            self.saveInDB(nombres, apellidos: apellidos, telefono:  telefono, correo: email, clave: password)
                            self.navigationController?.popViewController(animated: true)
                        }))
                        self.present(alertController, animated: true, completion: nil)
                    }else{
                        self.showAlertMessage(title: "Error", mensaje:  error!.localizedDescription)
                    }
                }
            }
        }
    }
    
    @IBAction func abrirFile(_ sender: Any) {
        cargarImagen()
    }
    
    func subirFotoAFirebase(){
        guard let imageSaved = imgPerfil.image,
              let imageSavedData = imageSaved.jpegData(compressionQuality: 0.1) else {
                        
            return
        }
        
        let metaDataConfig = StorageMetadata()
        metaDataConfig.contentType = "image/jpg"
        
        let storage = Storage.storage()
        
        let imageName = Int.random(in: 100...1000)
        
        let folderReference = storage.reference(withPath: "fotos-conductores/\(imageName).jpg")
        
        DispatchQueue.global(qos: .background).async {
            folderReference.putData(imageSavedData, metadata: metaDataConfig) { (metaData: StorageMetadata?, error:Error?) in
                DispatchQueue.main.async {
                    if let error = error {
                        self.showAlertMessage(title: "Error al cargar foto", mensaje: error.localizedDescription)
                        
                        return
                    }
                }
            }
        }
        
    }
    
    func saveInDB(_ nombres:String, apellidos:String, telefono:String, correo:String, clave:String) {
        view.endEditing(true)
        db.collection("conductores").document(correo).setData([
            "nombres": nombres,
            "apellidos": apellidos,
            "telefono": telefono
        ])
    }
    
    fileprivate func showAlertMessage(title:String, mensaje: String) {
        let alertController = UIAlertController(title: title, message:mensaje, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func cargarImagen() {
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .photoLibrary
        imagePicker?.allowsEditing = true
        imagePicker?.delegate = self
        
        guard let imagePicker = imagePicker else {
            return
        }
        present(imagePicker, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
            
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)            
    }
        
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    

   @objc func keyboardWillShow(_ notification: Notification){
     
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
         
        UIView.animate(withDuration: animationDuration) {
            self.constraintBottomScroll.constant = keyboardFrame.size.height
            self.view.layoutIfNeeded()
        }
   }
     
    @objc func keyboardWillHide(_ notification: Notification){
         
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
           
        UIView.animate(withDuration: animationDuration) {
            self.constraintBottomScroll.constant = 10
            self.view.layoutIfNeeded()
        }
    }
}

extension RegistroViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        imagePicker?.dismiss(animated: true, completion: nil)
        
        if info.keys.contains(.originalImage){
            self.imgPerfil.image = info[.originalImage] as? UIImage
        }
    }
    
}
