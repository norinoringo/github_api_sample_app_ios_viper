import Foundation

class StubAPIClient: HTTPClientProtocol {
    var result: Result<(Data, HTTPURLResponse), Error> = .success((Data(), HTTPURLResponse(url: URL(string: "https://github.com")!,
                                                                                           statusCode: 200,
                                                                                           httpVersion: nil,
                                                                                           headerFields: nil)!))

    func doURLSessionTask(req: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [unowned self] in
            completion(self.result)
        }
    }
}
