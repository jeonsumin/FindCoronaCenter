//
//  CenterNetwork.swift
//  FindCoronaCenter
//
//  Created by Terry on 2022/03/02.
//

import Foundation
import Combine

class CenterNetwork {
    private let session: URLSession
    let api = CenterAPI()
    
    init(session: URLSession = .shared){
        self.session = session
    }
    
    func getCenterList() -> AnyPublisher<[Center], URLError> {
        guard let url = api.getCenterListComponents().url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.setValue("Infuser AWZK+gUoPPtDDCI3tFlwYEJgKjKfXqkcrJfxfQ9VpCJVsK7MbbvDX7HLcf3tfPoSPRZ67csrYE91z4UNhnEK4Q==", forHTTPHeaderField: "Authorization")
        
        return session.dataTaskPublisher(for: request)
            .tryMap{ data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.unknown)
                }
                
                switch httpResponse.statusCode {
                case 200..<300:
                    return data
                case 400..<500:
                    throw URLError(.clientCertificateRejected)
                case 500..<599:
                    throw URLError(.badServerResponse)
                default:
                    throw URLError(.unknown)
                }
            }
            .decode(type: CenterAPIResponse.self, decoder: JSONDecoder())
            .map { $0.data }
            .mapError{ $0 as! URLError }
            .eraseToAnyPublisher()
    }
}
