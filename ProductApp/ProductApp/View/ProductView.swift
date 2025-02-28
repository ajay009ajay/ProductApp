//
//  ProductView.swift
//  InterviewProject
//
//
//  ProductView.swift
//  ProductApp
//
//  Created by Ajay Kumar Singh on 28/02/25.
//

import SwiftUI

struct ProductView: View {
    let product: ProductModel
    
    var body: some View {
        VStack {
            Text(product.title).font(.title)
            Text(product.price.description)
            Text(product.rating.description)
            AsyncImage(url: product.thumbnail) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(product.images, id: \.self) { image in
                        AsyncImage(url: image) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }.frame(height: 150)
        }
    }
}
