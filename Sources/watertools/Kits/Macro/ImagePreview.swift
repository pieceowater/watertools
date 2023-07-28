//
//  ImagePreview.swift
//  
//
//  Created by yury mid on 28.07.2023.
//

import SwiftUI

struct ImagePreview: View {
    @Environment(\.presentationMode) var presentationMode
    public var image: UIImage?
    public var images: [UIImage]?

    public init(image: UIImage? = nil, images: [UIImage]? = nil) {
        self.image = image
        self.images = images
    }
    
    public var body: some View {
        VStack {
            Spacer()
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }

            if let images = images {
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        }
                    }
                }
                .padding()
            }
            Spacer()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title3)
                    .foregroundColor(.red.opacity(0.8))
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding()
            }

        }
    }
}
