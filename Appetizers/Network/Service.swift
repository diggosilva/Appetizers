//
//  Service.swift
//  Appetizers
//
//  Created by Diggo Silva on 02/12/23.

import Foundation

enum RequestWay {
    case unknown
    case online
    case local
}

protocol ServiceProtocol: AnyObject {
    
    var dataTask: URLSessionDataTask? { get set }
    func isUpdating() -> Bool
    
    func getAppetizers(onSuccess: @escaping([Appetizer], RequestWay) -> Void, onError: @escaping(Error) -> Void)
}

final class Service: ServiceProtocol {
    var dataTask: URLSessionDataTask?
    
    var appetizerUrl: String = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    func isUpdating() -> Bool {
        if let dataTask = dataTask {
            return dataTask.state == .running
        }
        return false
    }
    
    func getAppetizers(onSuccess: @escaping([Appetizer], RequestWay) -> Void, onError: @escaping(Error) -> Void) {
        guard let url = URL(string: appetizerUrl) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let response = response as? HTTPURLResponse {
                    print("DEBUG: Status Code: \(response.statusCode)")
                }
                
                if let error = error {
                    print("DEBUG: Falha ao decodificar com o erro: \(error.localizedDescription)")
                }
                
                if let data = data,
                   let appetizers = try? JSONDecoder().decode(AppetizerResponse.self, from: data) {
                    
                    //Dados do servidor
                    onSuccess(appetizers.request, .online)
                } else if let path = Bundle.main.path(forResource: "appetizers", ofType: "json"),
                          let data = try? Data(contentsOf: URL(filePath: path)),
                          let appetizers = try? JSONDecoder().decode(AppetizerResponse.self, from: data) {
                    
                    //Dados locais
                    onSuccess(appetizers.request, .local)
                } else {
                    onError(NSError(domain: "DEBUG: Erro ao decodificar os Dados Mockados.", code: 1))
                }
            }
        }
        dataTask?.resume()
    }
}
    
//    func getAppetizers(onSuccess: @escaping([Appetizer]) -> Void, onError: @escaping(Error) -> Void) {
//        guard let url = URL(string: appetizerUrl) else { return }
//        
//        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
//            DispatchQueue.main.async {
//                if let response = response as? HTTPURLResponse {
//                    print("DEBUG: Status Code: \(response.statusCode)")
//                }
//                
//                guard let data, error == nil else { return }
//                do {
//                    let appetizer = try JSONDecoder().decode(AppetizerResponse.self, from: data)
//                    onSuccess(appetizer.request)
//                } catch {
//                    onError(error)
//                    print("DEBUG: Falha ao decodificar com o erro: \(error.localizedDescription)")
//                }
//            }
//        }
//        dataTask?.resume()
//    }
