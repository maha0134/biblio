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
	private var pageCount: Int { book.volumeInfo?.pageCount ?? 0 }
	private var country: String { book.saleInfo?.country ?? "" }
	private var isEbook: Bool { book.saleInfo?.isEbook ?? false }
	
	var body: some View {
		
		ScrollView {
			VStack(spacing: 5) {
				AsyncImage(url: URL(string: thumbnail))
				
				Text(title)
					.font(.title)
					.fontWeight(.bold)
				Divider()
				HStack{
					Text(authors.count > 1 ? "Authors:" : "Author:")
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
				
				Divider()
				
				VStack(alignment: .leading, spacing: 5) {
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
					.frame(maxWidth: .infinity, alignment: .trailing)
					
				}.padding()
				
				HStack {
					Text("\(pageCount) pages")
						if isEbook {
							if let link = book.saleInfo?.buyLink{
								Link("Buy ebook", destination: URL(string: link)!)
							} else {
								Text(" - ebook available")
							}
						} else {
							Text("ebook not available")
						}
				}
				Text("Country - \(country)")
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
