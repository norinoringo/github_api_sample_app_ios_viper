import Foundation

class GitHubUserRepositoryClient: FetchGitHubUserRepositoryRepository {
    func fetchGitHubUserRepository(input: FetchGitHubUserRepositoryUseCaseInput, block: @escaping ([GitHubUserRepositry]?, Error?) -> Void) {
        let userName = input.githubUser.login
        var req = URLRequest(url: URL(string: "https://api.github.com/users/\(userName)/repos")!)
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
                            block(nil, error)
                        }
                    }
                }
            }
            do {
                let response = try JSONDecoder().decode([GitHubUserRepositry].self, from: data!)
                DispatchQueue.main.async {
                    block(response, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    block(nil, error)
                }
            }
        })
        task.resume()
    }
}
