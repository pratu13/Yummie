//
//  NetworkingService.swift
//  Yummie
//
//  Created by Pratyush  on 10/27/21.
//

import Foundation
import SwiftUI

struct NetworkingService {
    
    public static let shared = NetworkingService()
    
    private init() {}
    
    func myFirstRequest() {
        request(route: .temp, method: .get, parameters: [:], type: String.self) { (result) -> () in
            print(result)
        }
    }
    
    private func request<T: Codable>(route: Route,
                                     method: Method,
                                     parameters: [String : Any]? = nil,
                                     type: T.Type,
                                     completion: @escaping (Result<T, Error>) -> () ) {
        
        guard let request = createRequest(route: route, method: method, parameter: parameters) else {
            completion(.failure(AppError.unknown))
            return 
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data,Error>?
            if let data = data {
                result = .success(data)
            } else if let error = error {
                result = .failure(error)
            }
            DispatchQueue.main.async {
                handleResponse(result: result, completion: completion)
            }
        }.resume()
    }
    
    private func handleResponse<T: Codable>(result: Result<Data, Error>?, completion: @escaping (Result<T, Error>) -> ()) {
        guard let result = result else {
            completion(.failure(AppError.unknown))
            return
        }
        switch result {
        case .success(let data):
            guard let resultData = try? JSONDecoder().decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            if let error = resultData.error {
                completion(.failure(AppError.serverError(error)))
            }
            if let decodedData = resultData.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.unknown))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    /// Helps to generate a urlrequte
    /// - Parameters:
    ///   - route: the path to the resourse in the backend
    ///   - method: type of reuquest to be made
    ///   - parameter: extra infor that needs to be passed to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route, method: Method, parameter: [String: Any]? = nil) -> URLRequest? {
        guard let url = URL(string: Route.baseURL + route.description) else  {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let params = parameter {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: url.absoluteString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                request.url = urlComponent?.url
            case .post, .delete, .patch:
                request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            }
            print(request)
        }
        return request
    }
    
}
