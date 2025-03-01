//
//  CategoriesViewModelTests.swift
//  ProductAppTests
//
//  Created by Ajay Kumar Singh on 01/03/25.
//

import Testing
import XCTest
@testable import ProductApp

class CategoriesViewModelTests: XCTestCase {

    @Test
    func loadCategories() async throws {
        let viewModel = CategoriesViewModel(apiClient: MockApiClient())
        await viewModel.loadCategories()
        XCTAssertTrue(viewModel.categories.count > 0)
    }
}
