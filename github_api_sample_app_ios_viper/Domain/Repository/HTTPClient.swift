import Foundation

public protocol HTTPClient {
    func doURLSessionTask(req: URLRequest, completionHandler: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}
