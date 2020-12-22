//
//  ContactDetailVC.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit
import Kingfisher

class ContactDetailVC: UIViewController {

    @IBOutlet private weak var contactImageView: UIImageView!
    @IBOutlet private weak var nameTF: UITextField!
    @IBOutlet private weak var secondNameTF: UITextField!
    @IBOutlet private weak var emailTF: UITextField!
    
    var contact: ContactModel?
    private var coreDataContact: Contact?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let contact = contact {
            coreDataContact = PersistanceManager.shared.fetchContactWithEmail(email: contact.email ?? "")
            nameTF.text = contact.name
            secondNameTF.text = contact.secondName
            emailTF.text = contact.email
            
            switch contact.sourceType {
            case .local:
                (contact.photoData ?? Data()).toImageView(contactImageView)
            case .network:
                if let url = contact.photoURL {
                    contactImageView.kf.setImage(with: url)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func deleteContact(_ sender: UIBarButtonItem) {
        PersistanceManager.shared.deleteContactWithEmail(email: contact?.email ?? "")
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        coreDataContact?.name = nameTF.text
        coreDataContact?.secondName = secondNameTF.text
        coreDataContact?.email = emailTF.text
        PersistanceManager.shared.saveContext()
        navigationController?.popToRootViewController(animated: true)
    }
}
