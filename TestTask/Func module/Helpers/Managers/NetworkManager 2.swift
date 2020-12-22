//
//  NetworkManager.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    private init() {}
    
    static var shared: NetworkManager {
        return NetworkManager()
    }
    
    func getContactList(count: Int, completionHandler: (([ContactModel]) -> Void)?) {
        guard let url = URL(string: "https://randomuser.me/api/?results=\(count)") else { return }
        AF.request(url).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let response = JSON(value)
                var resultContactArray: [ContactModel] = []
                for (_, result) in response["results"] {
                    let name = result["name"]["first"].string
                    let secondName = result["name"]["last"].string
                    let email = result["email"].string
                    let photoURL = result["picture"]["medium"].url
                    
                    let contact = ContactModel(name: name, secondName: secondName, photoURL: photoURL, email: email, sourceType: .network)
                    resultContactArray.append(contact)
                }

                completionHandler?(resultContactArray)
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
