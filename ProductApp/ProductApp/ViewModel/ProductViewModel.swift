//
//  ProductViewModel.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [ProductModel] = []
    private let category: CategoryModel
    var categoryName: String {
        category.name
    }

    private let apiClient: NetworkServiceProtocol


    init(category: CategoryModel, apiClient: NetworkServiceProtocol) {
        self.category = category
        self.apiClient = apiClient
    }

    @MainActor
    func loadProducts() async {
        products = []
        do {
            if let productsData = try await apiClient.getProducts(inCategory: category) {
                products = productsData
            }
        } catch {
            print(error)
        }
    }
}
