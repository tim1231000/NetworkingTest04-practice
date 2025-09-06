//
//  ContentView.swift
//  NetworkingTest04
//
//  Created by 최욱진 on 9/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            
            Task {
                await apiCall()
            }
            
        }
        
        
    }
    
    func apiCall() async {
        
        // 1. URL
        if let url = URL(string: "https://api.pexels.com/v1/search?query=nature&per_page=1") {
            
            // 2. URLRequest
            var request = URLRequest(url: url)
            request.addValue("PWUp6sAtMGRrY1HPn8r6nOw8qOCdsc136yAdSyL6Y5m1WEDSc2cCitjh", forHTTPHeaderField: "Authorization")
            
            // 3. URLSession
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                
                print(data)
                print(response)
            }
            catch {
                print(error)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
