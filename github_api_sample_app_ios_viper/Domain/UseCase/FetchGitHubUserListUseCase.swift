import Foundation
import Promises

struct FetchGitHubUserListUseCaseInput {
    let accessToken: String
}

struct FetchGitHubUserListUseCaseOutput {
    let gitHubUerList: [GitHubUser]
}

class FetchGitHubUserListUseCase {
    let repository: FetchGitHubAPIClientRepository

    init(repository: FetchGitHubAPIClientRepository) {
        self.repository = repository
    }

    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput) -> Promise<FetchGitHubUserListUseCaseOutput> {
        return Promise<FetchGitHubUserListUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            self.repository.fetchGitHubUserList(input: input) { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        reject(error)
                    case let .success(result):
                        fullfill(FetchGitHubUserListUseCaseOutput(gitHubUerList: result))
                    }
                }
            }
        }
    }
}
