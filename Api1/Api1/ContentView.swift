//
//  ContentView.swift
//  Api1
//
//  Created by afnan saad on 27/01/1445 AH.
//

import SwiftUI

struct ContentView: View {
let session : URLSession = .shared //1
    var body: some View {
        VStack {
         
        Text("Hello, world!")
        .onAppear(){//2
                let url = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population")//الربط
                let requst = URLRequest(url: url! )
                let task = session.dataTask(with: requst)
                {(data , response ,error)
                    in
                    if let error = error {
                    print("Error \(error)")
                    return
                    }
                if let data = data {
                        
                if let content = String (bytes: data, encoding: .utf8){
                print(content)
                     
                let decoder = JSONDecoder()
                do{
              let datastrauct = try decoder.decode(dataStruct.self, from: data)
                print(datastrauct)
                                
                }
            catch{
            print ("error", error)
                            }
                        }
                    }
                }
                task.resume()
            }//on
            
        }//vstak
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}


//struct CatFact : Codable{
//    let fact : String
//    let length : Int
//
//
//
//}
struct dataStruct : Codable{
    let  Nation : String
    var ID_Year: Int
    var Year:String
    var Population:Double
    
    
}


