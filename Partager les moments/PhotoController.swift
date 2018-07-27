//
//  PhotoController.swift
//  Partager les moments
//
//  Created by MAC-Anas on 26/07/2018.
//  Copyright © 2018 MAC-Anas. All rights reserved.
//

import UIKit

class PhotoController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var photoPartager: UIImageView!
    @IBOutlet weak var textePartager: UITextView!
    @IBOutlet weak var partagerBouton: UIBarButtonItem!
    
    let texteVide = "Entrez un texte ..."
    var imagePicker: UIImagePickerController?

    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlace()
    }
    
    func miseEnPlace() {
        
        photoPartager.contentMode = .scaleAspectFit
        photoPartager.image = #imageLiteral(resourceName: "profil.svg")
        photoPartager.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(prendrePhoto))
        photoPartager.addGestureRecognizer(tap)
        
        textePartager.text = texteVide
        
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        imagePicker?.allowsEditing = true
        
        textePartager.delegate = self
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image: UIImage?
        
        if let editee = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = editee
        } else if let originale = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = originale
        }
        
        photoPartager.image = image
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == texteVide {
            textView.text = ""
        }
    }
    
    @objc func prendrePhoto() {
        guard imagePicker != nil else {
            return
        }
        let alerte = UIAlertController(title: "Prendre photo?", message: "Choisir le media", preferredStyle: .actionSheet)
        let appareil = UIAlertAction(title: "Appareil photo", style: .default) { (act) in
            // si la camera existe
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker?.sourceType = .camera
                self.present(self.imagePicker!, animated: true, completion: nil)
            }
        }
        let librairie = UIAlertAction(title: "Librairie de photo", style: .default) { (act) in
            self.imagePicker?.sourceType = .photoLibrary
            self.present(self.imagePicker!, animated: true, completion: nil)
        }
        let annuler = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        
        alerte.addAction(appareil)
        alerte.addAction(librairie)
        alerte.addAction(annuler)
        
        // faire un teste si c'est un ipad pour ne pas crasher
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let pop = alerte.popoverPresentationController {
                pop.sourceView = self.view
                pop.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
                pop.permittedArrowDirections = []
            }
        }
        self.present(alerte, animated: true, completion: nil)
    }
    
    @IBAction func boutonPartagerAppuye(_ sender: Any) {
    }
    

}









