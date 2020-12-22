//
//  TotalVC.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit

class TotalVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.118, green: 0.118, blue: 0.184, alpha: 1)
        let tap = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        totalLabel.isUserInteractionEnabled = true
        totalLabel.addGestureRecognizer(tap)
        
        let attributedString = NSMutableAttributedString(string: "Lorem Ipsum is simply dummy text of the print ing and type setting industry. Lorem Ipsum has been the industry's.")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0.1
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.string.count))
        
//        textView.attributedText = attributedString
        textView.text = "Lorem Ipsum is simply dummy text of the print ing and type setting industry. Lorem Ipsum has been the industry's."
        textView.contentInset = UIEdgeInsets.zero
    }
    
    @objc func backTapped() {
        dismiss(animated: true, completion: nil)
    }

}
