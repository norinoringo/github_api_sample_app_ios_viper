import Foundation

class GitHubUserAPIClient: FetchGitHubAPIClientRepository {
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

    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput, block: @escaping ([GitHubUser]?, Error?) -> Void) {
        var req = URLRequest(url: URL(string: "https://api.github.com/users")!)
        req.addValue("token \(input.accessToken)", forHTTPHeaderField: "Authorization")
        doURLSessionTask(req: req, block: block)
    }

    private func doURLSessionTask<ApiType: Decodable>(req: URLRequest, block: @escaping (ApiType?, Error?) -> Void) {
        let task: URLSessionTask = URLSession.shared.dataTask(with: req, completionHandler: { data, response, error in
            if let error = error {
                block(nil, error)
                return
            }
            if let response = response as? HTTPURLResponse {
                if response.statusCode >= 300 || response.statusCode < 200 {
                    do {
                        let dataMessage = try JSONDecoder().decode(GitHubAPIError.self, from: data!)
                        block(nil, dataMessage)
                    } catch {
                        print(error)
                        block(nil, error)
                    }
                }
            }
            do {
                let response = try JSONDecoder().decode(ApiType.self, from: data!)
                block(response, nil)
            } catch {
                block(nil, error)
            }
        })
        // URLSessionTaskを実行する
        task.resume()
    }
}
