//
//  APIManager.swift
//  SimpleDemo
//
//  Created by Nibha Aggarwal on 25/10/19.
//  Copyright © 2019 Nibha Aggarwal. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
//    //Singleton Method
//    static let sharedAPIManager = APIManager()
    
    
    
    
    class func createRequest(qMes: String, method: String, completionHandler: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        var request = URLRequest(url: URL(string: qMes)!)
        request.httpMethod = method
        request.timeoutInterval = 30
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue(authString, forHTTPHeaderField: "Authorization") // if you need some
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            guard error == nil && data != nil else {
                if data == nil && response == nil {
                    print("NetLost")
                    completionHandler(data, response, error)
                    return
                }
                else {
                    print("NoReponse")
                    completionHandler(data, response, error)
                    return
                }
                
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("Status Code Not 200")
                completionHandler(data, response, error)
                return
            }
            
            
            completionHandler(data, response, error)
        })
        task.resume()
    }
    
    
    
}


extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
    /**
     Add, update, or remove a query string parameter from the URL
     
     - parameter url:   the URL
     - parameter key:   the key of the query string parameter
     - parameter value: the value to replace the query string parameter, nil will remove item
     
     - returns: the URL with the mutated query string
     */
    func appendingQueryItem(_ name: String, value: Any?) -> String {
        guard var urlComponents = URLComponents(string: absoluteString) else {
            return absoluteString
        }
        
        urlComponents.queryItems = urlComponents.queryItems?
            .filter { $0.name.lowercased() != name.lowercased() } ?? []
        
        // Skip if nil value
        if let value = value {
            urlComponents.queryItems?.append(URLQueryItem(name: name, value: "\(value)"))
        }
        
        return urlComponents.string ?? absoluteString
    }
    
    /**
     Add, update, or remove a query string parameters from the URL
     
     - parameter url:   the URL
     - parameter values: the dictionary of query string parameters to replace
     
     - returns: the URL with the mutated query string
     */
    func appendingQueryItems(_ contentsOf: [String: Any?]) -> String {
        guard var urlComponents = URLComponents(string: absoluteString), !contentsOf.isEmpty else {
            return absoluteString
        }
        
        let keys = contentsOf.keys.map { $0.lowercased() }
        
        urlComponents.queryItems = urlComponents.queryItems?
            .filter { !keys.contains($0.name.lowercased()) } ?? []
        
        urlComponents.queryItems?.append(contentsOf: contentsOf.compactMap {
            guard let value = $0.value else { return nil } //Skip if nil
            return URLQueryItem(name: $0.key, value: "\(value)")
        })
        
        return urlComponents.string ?? absoluteString
    }
    
    /**
     Removes a query string parameter from the URL
     
     - parameter url:   the URL
     - parameter key:   the key of the query string parameter
     
     - returns: the URL with the mutated query string
     */
    func removeQueryItem(_ name: String) -> String {
        return appendingQueryItem(name, value: nil)
    }
}
