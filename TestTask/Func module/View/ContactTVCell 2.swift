//
//  ContactTVCell.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit
import Kingfisher

class ContactTVCell: UITableViewCell {

    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = photoImageView.frame.height/2
    }
    
    func setContact(_ contact: ContactModel, sourceType: ContactSourceType) {
        nameLabel.text = (contact.name ?? "") + " " + (contact.secondName ?? "")
        emailLabel.text = contact.email ?? "Unknowed email"
        
        switch sourceType {
        case .local:
            (contact.photoData ?? Data()).toImageView(photoImageView)
        case .network:
            photoImageView.kf.setImage(with: contact.photoURL)

        }
    }
}
