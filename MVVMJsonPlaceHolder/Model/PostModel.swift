//
//  PostModel.swift
//  MVVMJsonPlaceHolder
//
//  Created by Soner Karaevli on 16.04.2022.
//

import Foundation

// Get yaparken decodable
// Post yaparken encodable
// Aynı model ile hem get hem post yapıyorsak Codable
struct PostModel : Decodable {
    let userId : Int
    let id : Int
    let title : String
    let body : String
}
