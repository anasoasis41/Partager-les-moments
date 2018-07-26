//
//  PhotoController.swift
//  Partager les moments
//
//  Created by MAC-Anas on 26/07/2018.
//  Copyright © 2018 MAC-Anas. All rights reserved.
//

import UIKit

class PhotoController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
    
    @objc func prendrePhoto() {
        
    }
    
    @IBAction func boutonPartagerAppuye(_ sender: Any) {
    }
    

}









