//
//  CategoriesViewModel.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import Foundation

//view model that uses the api client and stores categories and products
class CategoriesViewModel: ObservableObject {
    @Published var categories: [CategoryModel] = []

    private let apiClient: NetworkServiceProtocol

    init(apiClient: NetworkServiceProtocol) {
        self.apiClient = apiClient
    }

    @MainActor
    func loadCategories() async {
        do {
            if let categoriesData = try await apiClient.getCategories() {
                categories = categoriesData
            }
        } catch {
            print(error)
        }
    }    
}
