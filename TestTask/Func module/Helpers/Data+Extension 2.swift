//
//  Data+Extension.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import Foundation
import UIKit

extension Data {
    
    func toImageView(_ imageView: UIImageView) {
        DispatchQueue.global().async {
            let image = UIImage(data: self)
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
}
