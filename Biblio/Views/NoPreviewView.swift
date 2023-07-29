//
//  NoPreviewView.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-07-29.
//

import SwiftUI

struct NoPreviewView: View {
    var body: some View {
        ZStack {
        	Rectangle()
			Text("No Preview Available")
				.foregroundColor(.gray)
        }
    }
}

struct NoPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        NoPreviewView()
    }
}
