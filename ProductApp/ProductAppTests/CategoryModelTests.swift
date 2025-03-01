//
//  CategoryModelTests.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 01/03/25.
//

import Testing
import XCTest
@testable import ProductApp

class CategoryModelTests: XCTestCase {

    func testCategoryModel() async {
        let category = try? await MockApiClient().getCategories()
        let firstCategory = category?.first
        XCTAssertEqual(category?.count, 1)
        XCTAssertEqual(firstCategory?.name, "Beauty")
    }
}
