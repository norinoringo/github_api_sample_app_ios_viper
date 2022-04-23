import Foundation
import Promises

struct FetchGitHubUserRepositoryListUseCaseInput {
    let accessToken: String
    let githubUser: GitHubUser
}

struct FetchGitHubUserRepositoryListUseCaseOutput {
    let gitHubUserRepository: [GitHubUserRepositry]
}

class FetchGitHubUserRepositoryListUseCase {
    let repository: FetchGitHubAPIClientRepository

    init(repository: FetchGitHubAPIClientRepository) {
        self.repository = repository
    }

    func fetchGitHubUserRepositoryList(input: FetchGitHubUserRepositoryListUseCaseInput) -> Promise<FetchGitHubUserRepositoryListUseCaseOutput> {
        return Promise<FetchGitHubUserRepositoryListUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            self.repository.fetchGitHubUserRepository(input: input) { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        reject(error)
                    case let .success(result):
                        fullfill(FetchGitHubUserRepositoryListUseCaseOutput(gitHubUserRepository: result))
                    }
                }
            }
        }
    }
}
