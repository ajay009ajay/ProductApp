//
//  CategoryModel.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import Foundation

struct CategoryModel: Decodable, Identifiable {
    var id = UUID().uuidString
    let name: String

    enum CodingKeys: CodingKey {
        case name
    }
}
