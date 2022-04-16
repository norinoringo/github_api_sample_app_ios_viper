import Foundation

extension URLSession: HTTPClientProtocol {
    public func doURLSessionTask(req: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let task: URLSessionTask = URLSession.shared.dataTask(with: req) { data, response, error in
            switch (data, response, error) {
            case let (_, _, error?):
                completion(Result.failure(error))
            case let (data?, response as HTTPURLResponse, _):
                completion(Result.success((data, response)))
            default:
                fatalError("unkown error \(String(describing: (data, response, error)))")
            }
        }
        task.resume()
    }
}
