//
//  ProductViewModelTests.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 01/03/25.
//

import Testing
import XCTest
@testable import ProductApp

class ProductViewModelTests: XCTestCase {

    func test_loadProducts() async throws {
        let viewModel = ProductViewModel(category: CategoryModel(name: "beauty"), apiClient: MockApiClient())
        await viewModel.loadProducts()
        XCTAssertTrue(viewModel.products.count > 0)
    }
}
