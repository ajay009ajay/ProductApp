//
//  CategoriesView.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var viewModel: CategoriesViewModel
    
    var body: some View {
            List(viewModel.categories) { category in
                NavigationLink(
                    category.name,
                    destination: ProductsView(
                        viewModel: ProductViewModel(
                            category: category,
                            apiClient: ApiClient(urlSession: URLSession.shared)
                        )
                    )
                )
            }.task {
                await viewModel.loadCategories()
            }
            .navigationTitle("Categories")
    }
}
