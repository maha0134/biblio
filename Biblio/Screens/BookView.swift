//
//  BookView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-16.
//

import SwiftUI

struct BookView: View {
	
	var book: Book
	@State private var expanded: Bool = false
	private var title: String { book.volumeInfo?.title ?? ""}
	private var authors: [String] { book.volumeInfo?.authors ?? []}
	private var description: String { book.volumeInfo?.description ?? ""}
	private var thumbnail: String { book.volumeInfo?.imageLinks?.thumbnail ?? "" }
	
	var body: some View {
		
		ScrollView {
			VStack(spacing: 5) {
				AsyncImage(url: URL(string: thumbnail))
				
				Text(title)
					.font(.title)
					.fontWeight(.bold)
				
				HStack{
					Text("Author(s):")
						.fontWeight(.bold)
					VStack(alignment: .leading) {
						ForEach(authors, id: \.self) {author in
							Text(author)
						}
					}
				}
				
				HStack{
					Text("Rating: ")
						.fontWeight(.bold)
					RatingStarsView(book: book)
				}
				
				VStack(alignment: .leading) {
					Text("Description:")
						.font(.title2)
						.fontWeight(.bold)
						.padding(.bottom, 5)
					
					Text(description)
						.lineLimit(expanded ? nil : 5)
					
					Button(action: {
						expanded.toggle()
					}, label: {
						Text(expanded ? "...read less" : "...read more")
					})
						.foregroundColor(.accentColor)
						.frame(maxWidth: .infinity, alignment: .trailing)
						
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
