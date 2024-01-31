//
//  loginResponseModel.swift
//  Insta
//
//  Created by support on 29/01/24.
//

import Foundation

struct loginResponseModel: Codable{
    var message : String?
    var email : String?
    var _id : String?
}
//{"message":"User has already logged in","email":"You are logged in as: Anjali@gmail.com","_id":"659d1f07d6305eb6b86c4958"}
