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
	private var authors: [String] { book.volumeInfo?.authors ?? []}
	private var rating: Float? { book.volumeInfo?.averageRating }
	private var fullStars:Int { Int(rating ?? 0) }
	private var halfStars: Bool { String(rating ?? 0).split(separator: ".")[1] == "0" ? false : true }
	private var description: String { book.volumeInfo?.description ?? ""}
	
	var body: some View {
		
		ScrollView {
			VStack(spacing: 5) {
				AsyncImage(url: URL(string: book.volumeInfo?.imageLinks?.thumbnail ?? ""))
				
				Text(title)
					.font(.title)
					.fontWeight(.bold)
				
				HStack{
					Text("Author(s):")
						.fontWeight(.bold)
					VStack {
						ForEach(authors, id: \.self) {author in
							Text(author)
						}
					}
				}
				
				HStack{
					Text("Rating: ")
						.fontWeight(.bold)
					RatingStarsView(fullStars: fullStars, halfStars: halfStars)
				}
				
				VStack(alignment: .leading) {
					Text("Description:")
						.font(.title2)
						.fontWeight(.bold)
						.padding(.bottom, 5)
					
					Text(description)
				}.padding()
			}
		}
		.padding()
		.font(.title3)
	}
}

struct BookView_Previews: PreviewProvider {
	static var previews: some View {
		BookView(book: SampleBook().sampleBook)
	}
}
