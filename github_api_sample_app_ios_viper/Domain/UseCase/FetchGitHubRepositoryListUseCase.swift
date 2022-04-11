import Foundation
import Promises

struct FetchGitHubRepositoryListUseCaseInput {
    let searchKeyword: String?
}

struct FetchGitHubRepositoryListUseCaseOutput {
    let githubRepository: GitHubRepositry
}

class FetchGitHubRepositoryListUseCase {
    let repository: FetchGitHubAPIClientRepository

    init(repository: FetchGitHubAPIClientRepository) {
        self.repository = repository
    }

    func fetchGitHubRepository(input: FetchGitHubRepositoryListUseCaseInput) -> Promise<FetchGitHubRepositoryListUseCaseOutput> {
        return Promise<FetchGitHubRepositoryListUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            self.repository.fetchGitHubRepository(input: input) { result, error in
                DispatchQueue.main.async {
                    if let error = error {
                        reject(error)
                    } else if let result = result {
                        fullfill(FetchGitHubRepositoryListUseCaseOutput(githubRepository: result))
                    } else {
                        reject(GitHubClientError.unkownError)
                    }
                }
            }
        }
    }
}
