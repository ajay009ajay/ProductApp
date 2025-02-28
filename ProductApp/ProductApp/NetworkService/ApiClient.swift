//
//  ApiClient.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import Foundation

//{
//  "slug": "beauty",
//  "name": "Beauty",
//  "url": "https://dummyjson.com/products/category/beauty"
//}

class ApiClient {
    
    enum Endpoint {
        case categories
        case products(category: CategoryModel)

        var url: URL {
            switch self {
            case .categories:
                return URL(string: "https://dummyjson.com/products/categories")!
            case .products(let category):
                return URL(string: "https://dummyjson.com/products/category/\(category.name)")!
            }
        }
    }
    
    func getCategories() async throws -> [CategoryModel] {
        //Load and return all categories from https://dummyjson.com/products/categories

        do {
            let (categoriesData, _) = try await URLSession.shared.data(from: Endpoint.categories.url)
            let categories = try JSONDecoder().decode([CategoryModel].self, from: categoriesData)
            return categories
        } catch {
            print("\(error)")
        }
        return []
    }
    
    func getProducts(inCategory category: CategoryModel) async throws -> [ProductModel] {
        //Load and return all products from https://dummyjson.com/products/category/{category}
        
        let (productsData, _) = try await URLSession.shared.data(from: Endpoint.products(category: category).url)
        let products = try! JSONDecoder().decode(ProductsResponseModel.self, from: productsData).products
        return products
    }
}
