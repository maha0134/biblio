//
//  BookSearchViewModel.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-09.
//

import Foundation

class BookSearchViewModel: ObservableObject {
	@Published var searchQuery: String = ""
	@Published var errorMessage: String = ""
	@Published var books = [Book]()
	@Published var showBookDisplayView = false
	@Published var isLoading = false
}
