//
//  PostData.swift
//  H4X0R
//
//  Created by Ramon Seoane Martin on 26/5/23.
//

import Foundation

struct Results: Decodable {
	
	let hits: [Post]
	
}

struct Post: Decodable, Identifiable {
	
	var id: String {
		return objectID
	}
	
	let objectID: String
	let points: Int
	let title: String
	let url: String?
}
