import Foundation
import Promises

struct FetchGitHubUserRepositoryUseCaseInput {
    let accessToken: String
    let githubUser: GitHubUser
}

struct FetchGitHubUserRepositoryUseCaseOutput {
    let gitHubUerRepository: [GitHubUserRepositry]
}

class FetchGitHubUserRepositoryUseCase {
    let repository: FetchGitHubAPIClientRepository

    init(repository: FetchGitHubAPIClientRepository) {
        self.repository = repository
    }

    func fetchGitHubUserList(input: FetchGitHubUserRepositoryUseCaseInput) -> Promise<FetchGitHubUserRepositoryUseCaseOutput> {
        return Promise<FetchGitHubUserRepositoryUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            self.repository.fetchGitHubUserRepository(input: input) { result, error in
                DispatchQueue.main.async {
                    if let error = error {
                        reject(error)
                    } else if let result = result {
                        fullfill(FetchGitHubUserRepositoryUseCaseOutput(gitHubUerRepository: result))
                    } else {
                        reject(GitHubClientError.unkownError)
                    }
                }
            }
        }
    }
}
