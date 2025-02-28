//
//  ProductModel.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import Foundation

struct ProductModel: Identifiable, Decodable {
    let id: Int
    let title: String
    let price: Double
    let rating: Double
    let thumbnail: URL
    let images: [URL]
}
