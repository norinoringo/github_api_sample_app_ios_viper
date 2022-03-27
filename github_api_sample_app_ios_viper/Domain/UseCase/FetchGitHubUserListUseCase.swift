import Foundation
import Promises

struct FetchGitHubUserListUseCaseInput {
    let accessToken: String
}

struct FetchGitHubUserListUseCaseOutput {
    let gitHubUerList: [GitHubUser]
}

class FetchGitHubUserListUseCase {
    let repository: FetchGitHubUserListRepository

    init(repository: FetchGitHubUserListRepository) {
        self.repository = repository
    }

    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput) -> Promise<FetchGitHubUserListUseCaseOutput> {
        return Promise<FetchGitHubUserListUseCaseOutput>(on: .main) { fullfill, reject in
            self.repository.fetchGitHubUserList(input: input) { result, error in
                if let error = error {
                    reject(error)
                } else if let result = result {
                    fullfill(FetchGitHubUserListUseCaseOutput(gitHubUerList: result))
                } else {
                    reject(GitHubClientError.unkownError)
                }
            }
        }
    }
}
