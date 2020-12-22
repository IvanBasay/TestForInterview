//
//  SaleResultTVCell.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit

class SaleResultTVCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var circleView: UIView!
    
    func setRandomData() {
        let price = Int.random(in: 100...3000)
        priceLabel.text = "\(price)$"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        let randomDay = Int.random(in: 1...28)
        dateLabel.text = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(24*randomDay*60*60)))
    }
    
}
