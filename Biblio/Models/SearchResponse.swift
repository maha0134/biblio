//
//  SearchResponse.swift
//  Biblio
//
//  Created by AKSHAY MAHAJAN on 2023-04-08.
//

import Foundation

struct BookSearchResponse: Codable {
	let kind: String
	let totalItems: Int
	let items: [Book]?
}

struct Book: Codable, Identifiable {
	let kind: String
	let id: String
	let etag: String?
	let selfLink: String?
	let volumeInfo: VolumeInfo?
	let saleInfo: SaleInfo?
	let accessInfo: AccessInfo?
	let searchInfo: SearchInfo?
}

struct VolumeInfo: Codable {
	let title: String
	let subtitle: String?
	let authors: [String]?
	let publisher: String?
	let publishedDate: String?
	let description: String?
	let industryIdentifiers: [IndustryIdentifier]?
	let readingModes: ReadingModes?
	let pageCount: Int?
	let printType: String?
	let averageRating: Float?
	let ratingsCount: Int?
	let categories: [String]?
	let maturityRating: String?
	let allowAnonLogging: Bool?
	let contentVersion: String?
	let panelizationSummary: PanelizationSummary?
	let imageLinks: ImageLinks?
	let language: String?
	let previewLink: String?
	let infoLink: String?
	let canonicalVolumeLink: String?
}

struct IndustryIdentifier: Codable {
	let type: String?
	let identifier: String?
}

struct ReadingModes: Codable {
	let text: Bool
	let image: Bool
}

struct PanelizationSummary: Codable {
	let containsEpubBubbles: Bool
	let containsImageBubbles: Bool
}

struct ImageLinks: Codable {
	let smallThumbnail: String?
	let thumbnail: String?
}

struct SaleInfo: Codable {
	let country: String?
	let saleability: String?
	let isEbook: Bool?
	let buyLink: String?
}

struct AccessInfo: Codable {
	let country: String?
	let viewability: String?
	let embeddable: Bool?
	let publicDomain: Bool?
	let textToSpeechPermission: String?
	let epub: Epub?
	let pdf: Pdf?
	let webReaderLink: String?
	let accessViewStatus: String?
	let quoteSharingAllowed: Bool?
}

struct Epub: Codable {
	let isAvailable: Bool?
	let downloadLink: String?
}

struct Pdf: Codable {
	let isAvailable: Bool?
	let downloadLink: String?
}

struct SearchInfo: Codable {
	let textSnippet: String?
}


struct SampleBook {
	let sampleBook = Book(kind: "books#volume", id: "LkaYzQEACAAJ", etag: "AYCJwJVTuvY", selfLink: "https://www.googleapis.com/books/v1/volumes/LkaYzQEACAAJ", volumeInfo: VolumeInfo(title: "Meghan and Harry", subtitle: "The Real Story", authors: ["Lady Colin Campbell","Jack Boss Reacher"], publisher: nil, publishedDate: "2020-06-25", description: "The fall from popular grace of the previously adulated brother of the heir to the British throne as a consequence of his marriage to a beautiful and dynamic Hollywood starlet of colour makes for fascinating reading in best-selling royal author Lady Colin Campbell's balanced account. Lady Colin knows her royal history and psychology, and as the first seven years of her adult life were spent in the USA she has a foot in both the American and British camps. With unique breadth of insight she goes behind the scenes, speaking to friends, relations, courtiers, and colleagues on both sides of the Atlantic to reveal the most unexpected royal story since the Abdication. She highlights the dilemmas involved and the issues that lurk beneath the surface, as to why the couple decided to step down as senior royals. She analyses the implications of the actions of a young and ambitious couple, in love with each other and with the empowering lure of fame and fortune. She leads the reader through the maze of contradictions, revealing how Californian culture has influenced the couple's conduct. She exposes how they tried and failed to change the royal system by adapting it to their own needs and ambitions, and, upon failing, how they decided to create a new system altogether.", industryIdentifiers: nil, readingModes: nil, pageCount: 411, printType: nil, averageRating: 3, ratingsCount: 2, categories: nil, maturityRating: nil, allowAnonLogging: false, contentVersion: nil, panelizationSummary: nil, imageLinks: ImageLinks(smallThumbnail: "http://books.google.com/books/content?id=_68eEAAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api", thumbnail: "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"), language: "en", previewLink: "http://books.google.ca/books?id=LkaYzQEACAAJ&dq=harry&hl=&cd=1&source=gbs_api", infoLink: "http://books.google.ca/books?id=LkaYzQEACAAJ&dq=harry&hl=&source=gbs_api", canonicalVolumeLink: nil), saleInfo: nil, accessInfo: nil, searchInfo: nil)
	
}
