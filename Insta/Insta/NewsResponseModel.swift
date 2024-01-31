//
//  NewsResponseModel.swift
//  Insta
//
//  Created by support on 29/01/24.
//

import Foundation
import UIKit

struct NewsResponseModal: Codable{
    var status : String
    var totalResults : Int
    var articles : [Articles]
}

struct Articles: Codable {
    var source : Source
    var author : String?
    var title : String?
    var description : String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable{
    var id: String?
    var name: String
}
//struct NewsResponseModal : Codable {
//    var id: Int
//    var title: String?
//    var description: String?
//    var price: Int
//    var discountPercentage: Float
//    var rating: Float
//    var stock: Int
//    var brand: String?
//    var category: String?
//    var thumbnail: String?
//    var images: [String]
//}



