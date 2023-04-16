//
//  StarsView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-16.
//

import SwiftUI

struct RatingStarsView: View {
	var book: Book
	private var rating: Float? { book.volumeInfo?.averageRating }
	private var fullStars:Int { Int(rating ?? 0) }
	private var halfStars: Bool { String(rating ?? 0).split(separator: ".")[1] == "0" ? false : true }
	private var ratingsCount: Int { book.volumeInfo?.ratingsCount ?? 0 }
	
    var body: some View {
		HStack(spacing: 3) {
			
			ForEach(0..<5){ starIndex in
				
				if starIndex < fullStars {
					Image(systemName: "star.fill")
				} else if starIndex == fullStars {
					Image(systemName: halfStars ? "star.leadinghalf.filled" : "star")
				} else {
					Image(systemName: "star")
				}
			}
			Text("(\(ratingsCount))")
		}
		.foregroundColor(.brown)
    }
}

struct RatingStarsView_Previews: PreviewProvider {
    static var previews: some View {
		RatingStarsView(book: SampleBook().sampleBook)
    }
}
