import Foundation

class GitHubAPIClient: FetchGitHubAPIClientRepository {
    private var httpClient: HTTPClient

    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput, completion: @escaping (Result<[GitHubUser], Error>) -> Void) {
        var req = URLRequest(url: URL(string: "https://api.github.com/users")!)
        req.addValue("token \(input.accessToken)", forHTTPHeaderField: "Authorization")
        doURLSessionTask(req: req, completion: completion)
    }

    func fetchGitHubUserDetail(input: FetchGitHubUserDetailUseCaseInput, completion: @escaping (Result<GitHubUserDetail, Error>) -> Void) {
        let userName = input.githubUser.login
        var req = URLRequest(url: URL(string: "https://api.github.com/users/\(userName)")!)
        req.addValue("token \(input.accessToken)", forHTTPHeaderField: "Authorization")
        doURLSessionTask(req: req, completion: completion)
    }

    func fetchGitHubUserRepository(input: FetchGitHubUserRepositoryUseCaseInput, completion: @escaping (Result<[GitHubUserRepositry], Error>) -> Void) {
        let userName = input.githubUser.login
        var req = URLRequest(url: URL(string: "https://api.github.com/users/\(userName)/repos")!)
        req.addValue("token \(input.accessToken)", forHTTPHeaderField: "Authorization")
        doURLSessionTask(req: req, completion: completion)
    }

    func fetchGitHubRepository(input: FetchGitHubRepositoryListUseCaseInput, completion: @escaping (Result<GitHubRepositry, Error>) -> Void) {
        let searchKeyword = input.searchKeyword
        let keywordEncodedString = searchKeyword?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var req = URLRequest(url: URL(string: "https://api.github.com/search/repositories?q=\(keywordEncodedString ?? "")")!)
        doURLSessionTask(req: req, completion: completion)
    }
}

extension GitHubAPIClient {
    func doURLSessionTask<ResponseType: Decodable>(req: URLRequest, completion: @escaping (Result<ResponseType, Error>) -> Void) {
        httpClient.doURLSessionTask(req: req) { result in
            switch result {
            case let .failure(error):
                log.debug("通信エラー:\(error)")
                completion(Result.failure(error))
                return
            case let .success((data, urlResponse)):
                log.debug("\(ResponseType.self)_response:\(urlResponse)")
                if urlResponse.statusCode >= 300 || urlResponse.statusCode < 200 {
                    do {
                        let dataMessage = try JSONDecoder().decode(GitHubAPIError.self, from: data)
                        log.debug("エラーレスポンスのパース成功")
                        completion(Result.failure(dataMessage))
                    } catch {
                        log.debug("エラーレスポンスのパースエラー:\(error)")
                        completion(Result.failure(error))
                    }
                }
                do {
                    let response = try JSONDecoder().decode(ResponseType.self, from: data)
                    log.debug("\(ResponseType.self)レスポンスのパース成功")
                    completion(Result.success(response))
                } catch {
                    log.debug("レスポンスのパースエラー:\(error)")
                    completion(Result.failure(error))
                }
            }
        }
    }
}
