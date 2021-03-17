//
//  DetailView.swift
//  H4X0R SwiftUI
//
//  Created by GGolfz on 17/3/2564 BE.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url:String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url:"https://www.google.com")
    }
}
