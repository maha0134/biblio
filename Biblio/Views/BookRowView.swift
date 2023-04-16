//
//  BookView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-08.
//

import SwiftUI

struct BookRowView: View {
	var book: Book
	var rating: String {
		return String(format:"%.1f", book.volumeInfo?.averageRating ?? 0.00)
	}
    var body: some View {
		HStack(spacing: 20) {
			AsyncImage(url: URL(string: book.volumeInfo?.imageLinks?.smallThumbnail ?? ""))
				.scaledToFit()
				.frame(width: 130)
			VStack(alignment: .leading) {
				Text(book.volumeInfo?.title ?? "N/A")
				Text("Rating: \(rating)")
			}
			.frame(width: 200, alignment: .leading)
		}
		.padding()
    }
}

struct BookRowView_Previews: PreviewProvider {
    static var previews: some View {
		BookRowView(book: SampleBook().sampleBook)
    }
}
