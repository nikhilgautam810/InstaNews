//
//  NetworkHandler.swift
//  Insta
//
//  Created by support on 29/01/24.
//

import Foundation

class NetworkHandler{
    
    
    func loginAPICall(email: String, password: String, onSuccess: @escaping (_ val: Bool) -> Void ){
        let parameters = ["email" : email,
                          "password" : password]
        print("Parameters ", parameters)
        let urlString = "https://cricketscore-topaz.vercel.app/api/players/login"
        let url = URL(string: urlString)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task  = URLSession.shared.dataTask(with: urlRequest){
            data, httpResponse, error in
            guard let data = data else {
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do{
                let response = try? JSONDecoder().decode(loginResponseModel.self, from: data)
                print(response!)
                onSuccess(true)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
//    var newsViewController = NewsViewController()
    
    func newsApiCall(onNewsApiSuccess: @escaping (_ val: [Articles]?)->Void){
      let urlString = "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=1ab75809abd2419c9018382ba256ef78"
//      let urlString = "https://dummyjson.com/products/1"
      let url = URL(string: urlString)
      var urlRequest = URLRequest(url: url!)
      urlRequest.httpMethod = "GET"
//      urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
      let task = URLSession.shared.dataTask(with: urlRequest){
            data, response, error in
                guard let data = data else{
                    return
                }
            print(String(data: data, encoding: .utf8)!)
            do{
                let response1 = try? JSONDecoder().decode(NewsResponseModal.self, from: data)
                print("response: ",response1)
                onNewsApiSuccess(response1!.articles)
            }catch{
                print(error)
                onNewsApiSuccess(nil)
            }
      }
        task.resume()
        
    }
    
}
