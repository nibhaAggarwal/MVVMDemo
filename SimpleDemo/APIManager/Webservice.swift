//
//  Webservice.swift


import UIKit
import SystemConfiguration

enum NetworkError: Error {
    case parseUrl
    case parseJson
    case parseData
    case emptyResource
}

enum Webservice {
    static var numberOfRequests = 0 {
        didSet {
            DispatchQueue.main.async {
//                UIApplication.shared.isNetworkActivityIndicatorVisible =
//                    numberOfRequests > 0
            }
        }
    }
    
    @discardableResult
    static func load<T>(resource: Resource<T>?, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionTask? {
        guard let resource = resource else {
            completion(.failure(NetworkError.emptyResource))
            return nil
        }
        guard let url = URL(string: resource.url) else {
            completion(.failure(NetworkError.parseUrl))
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = resource.method.rawValue

        numberOfRequests += 1

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            numberOfRequests -= 1

            guard error == nil, let data = data else {
                completion(.failure(error!))
                return
            }
            guard let result = resource.parse(data) else {
                completion(.failure(NetworkError.parseData))
                return
            }
            completion(.success(result))
        }

        task.resume()
        return task
    }
}


