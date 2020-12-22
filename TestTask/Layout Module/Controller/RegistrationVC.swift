//
//  RegistrationVC.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit

class RegistrationVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var TFStackView: UIStackView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.184, alpha: 1)
        
        // TEXT FIELDS
        let allTFs = TFStackView.arrangedSubviews.map({ $0 as! UITextField })
        let placeholders = ["Name", "Email", "Username", "Password", "Confirm Password"]
        for (index, tf) in allTFs.enumerated() {
            tf.backgroundColor = UIColor(red: 0.22, green: 0.231, blue: 0.314, alpha: 1)
            tf.layer.cornerRadius = 4
            tf.attributedPlaceholder = NSAttributedString(string: placeholders[index], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
        
        passwordTF.isSecureTextEntry = true
        confirmPasswordTF.isSecureTextEntry = true
        
        // DONE BUTTON
        doneButton.backgroundColor = UIColor(red: 0.122, green: 0.557, blue: 0.945, alpha: 1)
        doneButton.setTitle("REGISTER", for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.layer.cornerRadius = 4
        
        // TITLE LABEL
        titleLabel.text = "Register"
        titleLabel.textColor = UIColor(red: 0.122, green: 0.557, blue: 0.945, alpha: 1)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
