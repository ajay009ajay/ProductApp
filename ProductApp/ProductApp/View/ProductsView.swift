//  ProductsView.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import SwiftUI

struct ProductsView: View {
    @StateObject var viewModel: ProductViewModel
    
    var body: some View {
        List(viewModel.products) { product in
            NavigationLink(product.title, destination: ProductView(product: product))
        }.onAppear {
            viewModel.loadProducts()
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu(content: {
                    Button(ProductsOrder.sortByTitle.rawValue) {
                        viewModel.products.sort {
                            $0.title < $1.title
                        }
                    }
                    Button(ProductsOrder.priceAscending.rawValue) {
                        viewModel.products.sort {
                            $0.price < $1.price
                        }
                    }
                    Button(ProductsOrder.priceDescending.rawValue) {
                        viewModel.products.sort {
                            $0.price > $1.price
                        }
                    }
                }, label: {Text("Sort")})
            }
        }
    }
}

