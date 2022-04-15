import Foundation

extension URLSession: HTTPClientProtocol {
    public func doURLSessionTask(req: URLRequest, completionHandler: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let task: URLSessionTask = URLSession.shared.dataTask(with: req) { data, response, error in
            switch (data, response, error) {
            case let (_, _, error?):
                completionHandler(Result.failure(error))
            case let (data?, response as HTTPURLResponse, _):
                completionHandler(Result.success((data, response)))
            default:
                fatalError("unkown error \(String(describing: (data, response, error)))")
            }
        }
        task.resume()
    }
}
