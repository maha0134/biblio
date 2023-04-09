//
//  BookView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-08.
//

import SwiftUI

struct BookView: View {
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
				Text(book.volumeInfo?.subtitle ?? "")
				Text("Rating: \(rating)")
			}
		}.padding()
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
		BookView(book: SampleBook().sampleBook)
    }
}
