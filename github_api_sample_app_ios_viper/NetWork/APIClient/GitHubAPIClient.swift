import Foundation

class GitHubUserAPIClient: FetchGitHubAPIClientRepository {
    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput, block: @escaping ([GitHubUser]?, Error?) -> Void) {
        var req = URLRequest(url: URL(string: "https://api.github.com/users")!)
        req.addValue("token \(input.accessToken)", forHTTPHeaderField: "Authorization")
        doURLSessionTask(req: req, block: block)
    }

    func fetchGitHubUserDetail(input: FetchGitHubUserDetailUseCaseInput, block: @escaping (GitHubUserDetail?, Error?) -> Void) {
        let userName = input.githubUser.login
        var req = URLRequest(url: URL(string: "https://api.github.com/users/\(userName)")!)
        req.addValue("token \(input.accessToken)", forHTTPHeaderField: "Authorization")
        doURLSessionTask(req: req, block: block)
    }

    func fetchGitHubUserRepository(input: FetchGitHubUserRepositoryUseCaseInput, block: @escaping ([GitHubUserRepositry]?, Error?) -> Void) {
        let userName = input.githubUser.login
        var req = URLRequest(url: URL(string: "https://api.github.com/users/\(userName)/repos")!)
        req.addValue("token \(input.accessToken)", forHTTPHeaderField: "Authorization")
        doURLSessionTask(req: req, block: block)
    }

    func fetchGitHubRepository(input: FetchGitHubRepositoryListUseCaseInput, block: @escaping (GitHubRepositry?, Error?) -> Void) {
        let searchKeyword = input.searchKeyword
        let keywordEncodedString = searchKeyword?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var req = URLRequest(url: URL(string: "https://api.github.com/search/repositories?q=\(keywordEncodedString ?? "")")!)
        doURLSessionTask(req: req, block: block)
    }
}

extension GitHubUserAPIClient {
    private func doURLSessionTask<ResponseType: Decodable>(req: URLRequest, block: @escaping (ResponseType?, Error?) -> Void) {
        let task: URLSessionTask = URLSession.shared.dataTask(with: req, completionHandler: { data, response, error in
            if let error = error {
                log.debug("通信エラー:\(error)")
                block(nil, error)
                return
            }
            log.debug("\(ResponseType.self)_response:\(response)")
            if let response = response as? HTTPURLResponse {
                if response.statusCode >= 300 || response.statusCode < 200 {
                    do {
                        let dataMessage = try JSONDecoder().decode(GitHubAPIError.self, from: data!)
                        log.debug("エラーレスポンスのパース成功")
                        block(nil, dataMessage)
                    } catch {
                        log.debug("レスポンスのパースエラー:\(error)")
                        block(nil, error)
                    }
                }
            }
            do {
                let response = try JSONDecoder().decode(ResponseType.self, from: data!)
                log.debug("\(ResponseType.self)レスポンスのパース成功")
                block(response, nil)
            } catch {
                log.debug("レスポンスのパースエラー:\(error)")
                block(nil, error)
            }
        })
        // URLSessionTaskを実行する
        task.resume()
    }
}
