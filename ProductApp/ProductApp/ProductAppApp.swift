//
//  ProductAppApp.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import SwiftUI

@main
struct ProductAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CategoriesView(
                    viewModel: CategoriesViewModel(
                        apiClient: ApiClient(urlSession: URLSession.shared)
                    )
                )
            }
        }
    }
}
