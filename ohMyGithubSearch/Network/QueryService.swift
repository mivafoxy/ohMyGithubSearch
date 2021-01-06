//
//  QueryService.swift
//  ohMyGithubSearch
//
//  Created by Milandr on 06.01.2021.
//

import Foundation

class QueryService: NSObject {
    // 1
    fileprivate let token = ""
    fileprivate let scheme = "https"
    fileprivate let host = "api.github.com"
    fileprivate let hostPath = "https://api.github.com"
    fileprivate let searchRepoPath = "/search/repositories"
    fileprivate let defaultHeaders = [
        "Content-Type" : "application/json",
        "Accept" : "application/vnd.github.v3+json"
    ]
    // 2
    public lazy var defaultSession: URLSession = {
        // 3
        let configuration = URLSessionConfiguration.default
        // 4
        configuration.timeoutIntervalForRequest = 30
        // 5
        configuration.allowsCellularAccess = false
        // 6
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        // 7
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: queue)
        return session
    }()
    
    public func searchRepository(repositoryName: String, language: String, ordered: Bool) -> URLRequest? {
        // 9
        var urlComponents = URLComponents()
        // 10
        urlComponents.scheme = scheme
        // 11
        urlComponents.host = host
        // 12
        urlComponents.path = searchRepoPath
        // 13
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: "\(repositoryName)+language:\(language)"),
            URLQueryItem(name: "order", value: ordered ? "asc":"desc")
        ]
        // 14
        guard let url = urlComponents.url else {
            return nil
        }
        print("search request url:\(url)")
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = defaultHeaders
        return request
    }
}

extension QueryService: URLSessionDataDelegate {
    // 13
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        guard let text = String(data: data, encoding: .utf8) else {
            print("data encoding error")
            return
        }
        print("didReceive data: \(text)")
    }
    // 14
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print("didCompleteWithError:\(error.localizedDescription)")
        }
    }
    // 15
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Swift.Void) {
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 401 {
                print("http response error: status code \(httpResponse.statusCode), description: Unauthorized")
                // 16
                completionHandler(URLSession.ResponseDisposition.cancel)
            } else {
                print("http status code: \(httpResponse.statusCode)")
                // 17
                completionHandler(URLSession.ResponseDisposition.allow)
            }
        }
    }
}
