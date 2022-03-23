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
    let repository: FetchGitHubUserRepositoryRepository

    init(repository: FetchGitHubUserRepositoryRepository) {
        self.repository = repository
    }

    func fetchGitHubUserList(input: FetchGitHubUserRepositoryUseCaseInput) -> Promise<FetchGitHubUserRepositoryUseCaseOutput> {
        Promise<FetchGitHubUserRepositoryUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            DispatchQueue.main.async {
                self.repository.fetchGitHubUserRepository(input: input) { result, error in
                    if let error = error {
                        reject(error)
                    } else if let result = result {
                        fullfill(FetchGitHubUserRepositoryUseCaseOutput(gitHubUerRepository: result))
                    } else {
                        reject(error!)
                    }
                }
            }
        }
    }
}
