//
//  UserModel.swift
//  SwiftExample
//
//  Created by Bandar Alruwaili on 27/02/2023.
//

import UIKit

public class UserModel: NSObject {
    var id: Int = 0
    var Username: String = "BandarHelal"
    var email: String = "BandarHelal@sgsg.com"
    
    @objc public func getUser() -> String {
        return "Name: \(self.Username)\nEmail: \(self.email)"
    }
}
