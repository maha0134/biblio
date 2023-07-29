//
//  BookSearchView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-08.
//

import SwiftUI

struct BookSearchView: View {
	
	@ObservedObject private var vm = BookSearchViewModel()
	@FocusState private var focused
	
	var body: some View {
		
		NavigationStack{
			ZStack {
				VStack(spacing: 50) {
					HStack(alignment: .bottom) {
						Image(systemName: "books.vertical.fill")
							.foregroundColor(.brown)
						
						Text("Biblio")
							.fontWeight(.bold)
					}
					.font(.title)
					
					VStack {
						Text(vm.errorMessage)
							.foregroundColor(.red)
							.padding(.bottom, 10)
						
						Text("Search for your favourite book:")
							.frame(maxWidth: .infinity, alignment:.leading)
							.padding([.trailing, .leading], 20)
						
						TextField("Enter book name", text: $vm.searchQuery)
							.padding(7)
							.border(vm.errorMessage.isEmpty ? .black : .red)
							.padding([.leading, .trailing], 20)
							.padding(.bottom, 10)
							.font(.body)
							.onChange(of: vm.searchQuery) { newSearchQuery in
								if !newSearchQuery.isEmpty {
									vm.errorMessage = ""
								}
							}
							.focused($focused)
							.keyboardType(.webSearch)
						
						Button {
							searchRequested()
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
					.onSubmit {
						searchRequested()
					}
				}
				.navigationDestination(isPresented: $vm.showBookDisplayView) {
					BooksDisplayView(books: $vm.books, search: vm.searchQuery)
				}
				if vm.isLoading {
					ProgressView {
						Text("Searching for books...")
					}
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.background(Color.gray)
				}
			}
			.onTapGesture {
				focused = false
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
		url.append(queryItems: [URLQueryItem(name: "q", value: "\(vm.searchQuery)")])
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else {
				return
			}
			do {
				let decoder = JSONDecoder()
				let searchResponse = try decoder.decode(BookSearchResponse.self, from: data)
				
				DispatchQueue.main.async {
					vm.books = searchResponse.items ?? []
					vm.showBookDisplayView.toggle()
					vm.isLoading = false
				}
				
			} catch {
				print("request failed \(error)")
			}
		}.resume()
	}
	
	func searchRequested() {
		if vm.searchQuery.isEmpty {
			vm.errorMessage = "Please enter something to search"
		} else {
			focused = false
			vm.isLoading = true
			searchBook()
		}
	}
}
