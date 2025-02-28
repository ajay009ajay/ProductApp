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

    private let apiClient: ApiClient

    
    init(category: CategoryModel, apiClient: ApiClient) {
        self.category = category
        self.apiClient = apiClient
    }

    func loadProducts() {
        Task {
            products = []
            do {
                products = try await apiClient.getProducts(inCategory: category)
            } catch {
                print(error)
            }
        }
    }
}
