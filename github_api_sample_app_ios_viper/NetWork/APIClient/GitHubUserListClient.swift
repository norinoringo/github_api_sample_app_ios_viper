import Foundation

class GitHubUserListClient: FetchGitHubUserListRepository {
    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput, block: @escaping ([GitHubUser]?, Error?) -> Void) {
        var req = URLRequest(url: URL(string: "https://api.github.com/users")!)
        req.addValue("token \(input.accessToken)", forHTTPHeaderField: "Authorization")

        let task: URLSessionTask = URLSession.shared.dataTask(with: req, completionHandler: { data, response, error in
            if let error = error {
                block(nil, error)
                return
            }
            if let response = response as? HTTPURLResponse {
                if response.statusCode >= 300 || response.statusCode < 200 {
                    do {
                        let dataMessage = try JSONDecoder().decode(GitHubAPIError.self, from: data!)
                        DispatchQueue.main.async {
                            block(nil, dataMessage)
                        }
                    } catch {
                        print(error)
                        DispatchQueue.main.async {
                            block(nil, GitHubClientError.responseParseError(error))
                        }
                    }
                }
            }
            do {
                let response = try JSONDecoder().decode([GitHubUser].self, from: data!)
                DispatchQueue.main.async {
                    block(response, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    block(nil, GitHubClientError.responseParseError(error))
                }
            }
        })
        task.resume()
    }
}
