import Foundation

public protocol HTTPClient {
    func doURLSessionTask(req: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}
