//
//  Resource.swift
//

import UIKit

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

struct Resource<T> {
    let url: String
    let method: HTTPMethod
    let parse: (Data) -> T?
}
