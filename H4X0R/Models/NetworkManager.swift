//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Ramon Seoane Martin on 24/5/23.
//

import Foundation

class NetworkManager: ObservableObject {
	
	@Published var posts = [Post]()
	
	func fetchData() {
		// 1. Create a URL
		if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
			
			// 2. Create a URLSession
			let session = URLSession(configuration: .default)
			
			// 3. Give the session a task
			let task = session.dataTask(with: url) { (data, response, error) in
				
				if error == nil {
					if let safeData = data {
						if let results = self.parseJSON(safeData) {
							
							// Update List on main thread
							DispatchQueue.main.async {
								self.posts = results.hits
							}
						}
					}
				} else {
					// Control the error
					print(error!)
				}
			}
			
			// 4. Start the task
			task.resume()
		}
	}
	
	func parseJSON(_ safeData: Data) -> Results? {
		
		let decoder = JSONDecoder()
		
		do {
			// Decode the data
			let decodedData = try decoder.decode(Results.self, from: safeData)
			
			return decodedData
		} catch {
			// Deal with error
			print(error)
			return nil
		}
	}
}
