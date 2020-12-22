//
//  UDKey.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import Foundation

class UDKey {
    
    static var localStorageFill: Bool {
        get { return UserDefaults.standard.bool(forKey: "localStorageFill") }
        set { UserDefaults.standard.setValue(newValue, forKey: "localStorageFill") }
    }
}
