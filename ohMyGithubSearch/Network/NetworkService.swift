//
//  NetworkService.swift
//  ohMyGithubSearch
//
//  Created by Milandr on 06.01.2021.
//

import Foundation

class NetworkService {
    fileprivate let queryService = QueryService()
    
    public func callToSearchRepositories(
        repositoryName: String,
        language: String,
        order: Bool,
        completion: ((Data) -> (Void))?) {
        
        let queryService = QueryService()
        
        guard let request =
                queryService.searchRepository(
                    repositoryName: repositoryName,
                    language: language,
                    ordered: order) else {
            print("url request error")
            return
        }
        
        let dataTask =
            queryService.defaultSession.dataTask(
                with: request) { (data, response, error) in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("http status code: \(httpResponse.statusCode)")
                }
                
                guard let data = data else {
                    print("data did'not received")
                    return
                }
                
                
                completion?(data)
            }
        
        dataTask.resume()
    }
}
