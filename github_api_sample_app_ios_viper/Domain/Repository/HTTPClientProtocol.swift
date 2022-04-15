import Foundation

public protocol HTTPClientProtocol {
    func doURLSessionTask(req: URLRequest, completionHandler: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}
