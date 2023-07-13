//
//  DetailView.swift
//  H4X0R
//
//  Created by Ramon Seoane Martin on 26/5/23.
//

import SwiftUI


struct DetailView: View {
    
	let url: String?
	
	var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.amazon.es")
    }
}

