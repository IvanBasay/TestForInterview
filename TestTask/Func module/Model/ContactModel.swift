//
//  ContactModel.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import Foundation
import UIKit

enum ContactSourceType {
    case network, local
}

struct ContactModel {
    var name: String?
    var secondName: String?
    var photoURL: URL?
    var email: String?
    var photoData: Data?
    var sourceType: ContactSourceType
}
