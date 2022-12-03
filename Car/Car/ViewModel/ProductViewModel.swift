//
//  ProductViewModel.swift
//  Car
//
//  Created by youssef-mariem on 3/12/2022.
//

import Foundation
import SwiftUI



class ProductViewModel: ObservableObject {
    @Published var items = [ProductModel]()
    let prefixURL = "http://172.17.0.147:3000/api/product"
    
    
    init(){
        fetchProducts()
    }
    
    
    //MARK: - retrieve data
    func fetchProducts(){
        guard let url = URL(string: "\(prefixURL)") else {
            print("not found url")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                    
                }
                else {
                    print("no data")
                }
            }catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()

    }
    
    
    
    //MARK: - create data
    func createProduct(parameters: [String:Any]){
        guard let url = URL(string: "\(prefixURL)/add") else {
            print("not found url")
            return
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                    
                }
                else {
                    print("no data")
                }
            }catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
        

    }

    //MARK: - update data
    func updateProduct(parameters: [String:Any]){
        guard let url = URL(string: "\(prefixURL)/update") else {
            print("not found url")
            return
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                    
                }
                else {
                    print("no data")
                }
            }catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()

    }
    
    
    //MARK: - delete data
    func deleteProduct(parameters: [String:Any]){
        guard let url = URL(string: "\(prefixURL)/delete") else {
            print("not found url")
            return
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                    
                }
                else {
                    print("no data")
                }
            }catch let JsonError{
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()

    }
    
    
}
