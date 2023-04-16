//
//  BookView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-16.
//

import SwiftUI

struct BookView: View {
	var book: Book
	private var title: String { book.volumeInfo?.title ?? ""}
	private var rating: Float? { book.volumeInfo?.averageRating }
	private var fullStars:Int { Int(rating ?? 0) }
	private var halfStars: Bool { String(rating ?? 0).split(separator: ".")[1] == "0" ? false : true}
	
	var body: some View {
		ScrollView {
			AsyncImage(url: URL(string: book.volumeInfo?.imageLinks?.thumbnail ?? ""))
			
			Text(title)
				.font(.title)
			HStack{
				Text("Rating: ")
					.font(.title3)
				RatingStarsView(fullStars: fullStars, halfStars: halfStars)
			}
		}
		
	}
}

struct BookView_Previews: PreviewProvider {
	static var previews: some View {
		BookView(book: SampleBook().sampleBook)
	}
}
