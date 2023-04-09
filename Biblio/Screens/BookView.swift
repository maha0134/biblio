//
//  BookView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-08.
//

import SwiftUI

struct BookView: View {
	var book: Book
    var body: some View {
		VStack{
			AsyncImage(url: URL(string: book.volumeInfo?.imageLinks?.smallThumbnail ?? ""))
				.scaledToFit()
			Text(book.volumeInfo?.title ?? "N/A")
			Text(book.volumeInfo?.subtitle ?? "")
			Text("Rating: \(book.volumeInfo?.averageRating ?? 0)")
		}.padding()
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
		BookView(book: SampleBook().sampleBook)
    }
}
