//
//  StarsView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-16.
//

import SwiftUI

struct RatingStarsView: View {
	var fullStars: Int
	var halfStars: Bool
	
    var body: some View {
		HStack {
			ForEach(0..<5){ starIndex in
				if starIndex < fullStars {
					Image(systemName: "star.fill")
				} else if starIndex == fullStars {
					Image(systemName: halfStars ? "star.leadinghalf.filled" : "star")
					
				} else {
					Image(systemName: "star")
				}
			}
		}
		.foregroundColor(.brown)
    }
}

struct RatingStarsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingStarsView(fullStars: 0, halfStars: false)
    }
}
