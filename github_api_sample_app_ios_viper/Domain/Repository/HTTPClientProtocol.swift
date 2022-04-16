import Foundation

public protocol HTTPClientProtocol {
    func doURLSessionTask(req: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}
