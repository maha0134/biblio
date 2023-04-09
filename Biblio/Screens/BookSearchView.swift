//
//  BookSearchView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-08.
//

import SwiftUI

struct BookSearchView: View {
	
	@State private var searchQuery: String = ""
	@State private var errorMessage: String = ""
	@State private var books = [Book]()
	@State private var showBookDisplayView = false
	
	var body: some View {
		NavigationStack{
			VStack(spacing: 50) {
				HStack(alignment: .bottom) {
					Image(systemName: "books.vertical.fill")
						.foregroundColor(.brown)
					
					Text("Biblio")
						.fontWeight(.bold)
				}
				.font(.title)
				
				VStack {
					Text(errorMessage)
						.foregroundColor(.red)
						.padding(.bottom, 10)
					
					Text("Search for your favourite book:")
						.frame(maxWidth: .infinity, alignment:.leading)
						.padding([.trailing, .leading], 20)
					
					TextField("Enter book name", text: $searchQuery)
						.padding(7)
						.cornerRadius(5)
						.border(errorMessage.isEmpty ? .black : .red)
						.padding([.leading, .trailing], 20)
						.padding(.bottom, 10)
						.font(.body)
						.onChange(of: searchQuery) { newValue in
							if !newValue.isEmpty {
								errorMessage = ""
							}
						}
					
					Button {
						if searchQuery.isEmpty {
							errorMessage = "Please enter something to search"
						} else {
							searchBook()
						}
						
					} label: {
						Text("Search")
							.foregroundColor(.white)
							.fontWeight(.bold)
					}
					.padding([.top, .bottom], 10)
					.padding([.leading, .trailing], 15)
					.background(Color.brown)
					.cornerRadius(10)
				}
			}
			.navigationDestination(isPresented: $showBookDisplayView) {
				BooksDisplayView(books: $books, search: searchQuery)
			}
		}
	}
}

struct BookSearchView_Previews: PreviewProvider {
	static var previews: some View {
		BookSearchView()
	}
}

extension BookSearchView {
	func searchBook() {
		print("searching")
		
		var url = URL(string: "https://www.googleapis.com/books/v1/volumes?")!
		url.append(queryItems: [URLQueryItem(name: "q", value: "\(searchQuery)")])
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else {
				return
			}
			do {
				let decoder = JSONDecoder()
				let searchResponse = try decoder.decode(BookSearchResponse.self, from: data)
				self.books = searchResponse.items ?? []
				
				self.showBookDisplayView = true
			} catch {
				print("request failed \(error)")
			}
			
		}.resume()
		
		
	}
}
