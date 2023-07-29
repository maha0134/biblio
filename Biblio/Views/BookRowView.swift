//
//  BookView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-08.
//

import SwiftUI

struct BookRowView: View {
	var book: Book
	private var imageUrl: String { book.volumeInfo?.imageLinks?.smallThumbnail ?? "" }
	private var title: String { book.volumeInfo?.title ?? "" }
	
	var rating: String {
		return String(format:"%.1f", book.volumeInfo?.averageRating ?? 0.00)
	}
    var body: some View {
		HStack(spacing: 20) {
			
			AsyncImage(url: URL(string: imageUrl)) { image in
				image.resizable()
					.scaledToFit()
			} placeholder: {
				ProgressView()
			}
			.frame(width: 130)
			
			VStack(alignment: .leading) {
				Text(title)
				RatingStarsView(book: book)
			}
			.frame(width: 200, alignment: .leading)
			.font(.callout)
		}
		.padding()
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
		BookRowView(book: SampleBook().sampleBook)
    }
}
