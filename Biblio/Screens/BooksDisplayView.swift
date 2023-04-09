//
//  BooksDisplayView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-08.
//

import SwiftUI

struct BooksDisplayView: View {
	@Binding var books: [Book]
	let search: String
	
	var body: some View {
        
		ScrollView {
			HStack(spacing: 0) {
				Text("We found \(books.count) books for ")
				Text("\(search)")
					.fontWeight(.bold)
			}
			
			ForEach(books) { book in
				BookView(book: book)
				Divider()
			}
		}
    }
}

struct BooksDisplayView_Previews: PreviewProvider {
    static var previews: some View {
		BooksDisplayView(books: .constant([SampleBook().sampleBook, SampleBook().sampleBook]), search: "Harry")
    }
}
