//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Miks Latvis on 16/03/2022.
//

import SwiftUI

struct Response: Codable {
    var Measurements: [Result]
}

struct Result: Codable {
   // var id = UUID()
  //  var id: Int
    var Date: String
    var WeightActual: Double
  //  var collectionName: String
}

struct ContentView: View {
    @State private var Measurements = [Result]()

    var body: some View {
        ScrollView{
            ForEach(Measurements, id: \.Date) { item in
                Text("\(item.WeightActual) ")
            }
            
        }
        .task {
            print("before list")
            await loadData()
            print("after list")
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://trendweight.com/u/01175a8cdd3c49/data/") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                print("so far so good")
                Measurements = decodedResponse.Measurements
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
