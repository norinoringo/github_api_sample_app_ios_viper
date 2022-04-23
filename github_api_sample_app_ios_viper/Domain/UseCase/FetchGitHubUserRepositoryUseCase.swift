import Foundation
import Promises

struct FetchGitHubUserRepositoryUseCaseInput {
    let accessToken: String
    let githubUser: GitHubUser
}

struct FetchGitHubUserRepositoryUseCaseOutput {
    let gitHubUserRepository: [GitHubUserRepositry]
}

class FetchGitHubUserRepositoryUseCase {
    let repository: FetchGitHubAPIClientRepository

    init(repository: FetchGitHubAPIClientRepository) {
        self.repository = repository
    }

    func fetchGitHubUserRepositoryList(input: FetchGitHubUserRepositoryUseCaseInput) -> Promise<FetchGitHubUserRepositoryUseCaseOutput> {
        return Promise<FetchGitHubUserRepositoryUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            self.repository.fetchGitHubUserRepository(input: input) { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        reject(error)
                    case let .success(result):
                        fullfill(FetchGitHubUserRepositoryUseCaseOutput(gitHubUserRepository: result))
                    }
                }
            }
        }
    }
}
