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

    private let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    @MainActor
    func loadCategories() async {
        do {
            categories = try await apiClient.getCategories()
        } catch {
            print(error)
        }
    }    
}
