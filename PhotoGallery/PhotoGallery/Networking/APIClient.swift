//
//  APIClient.swift
//  PhotoGallery
//
//  Created by Lucía Medina Fretes on 06/07/2020.
//  Copyright © 2020 Tandem. All rights reserved.
//

import Foundation

protocol APIClientProtocol: AnyObject {
    func send<Request: APIRequest>(_ request: Request,
                                   completion: @escaping (Result<Request.Response, Error>) -> Void)
}

class APIClient: APIClientProtocol {

    private let baseURL: URL
    private let session = URLSession(configuration: .default)

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    func send<Request: APIRequest>(_ request: Request,
                                   completion: @escaping (Result<Request.Response, Error>) -> Void) {
        let urlRequest: URLRequest
        do {
            urlRequest = try self.makeURLRequest(with: request)
        } catch {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
            return
        }

        let task = session.dataTask(with: urlRequest) { data, httpResponse, error in
            guard let httpURLResponse = httpResponse as? HTTPURLResponse,
                error == nil else {
                    DispatchQueue.main.async {
                        completion(.failure(APIError.service))
                    }
                    return
            }

            switch httpURLResponse.statusCode {
            case 200 ..< 300:
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(APIError.service))
                    }
                    return
                }

                do {
                    let parsedResponse = try JSONDecoder().decode(Request.Response.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(parsedResponse))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(APIError.decoding))
                    }
                }
            default:
                DispatchQueue.main.async {
                    completion(.failure(APIError.service))
                }

            }
        }
        task.resume()
    }

    private func makeURLRequest<Request: APIRequest>(with request: Request) throws -> URLRequest {
        guard let url = URL(string: request.resourceName, relativeTo: baseURL) else {
            throw APIError.wrongResource
        }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)

        let queryItems: [URLQueryItem]
        do {
            queryItems = try URLQueryItemEncoder.encode(request)
        } catch {
            throw APIError.wrongResource
        }

        if queryItems.count > 0 {
            components?.queryItems = queryItems
        }

        guard let endpointURL = components?.url else {
            throw APIError.wrongResource
        }

        var urlRequest = URLRequest(url: endpointURL)
        urlRequest.httpMethod = request.httpMethod.rawValue
        urlRequest.timeoutInterval = 60.0

        return urlRequest
    }
}
