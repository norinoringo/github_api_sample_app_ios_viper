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
        Promise<FetchGitHubUserListUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            DispatchQueue.main.async {
                self.repository.fetchGitHubUserList(input: input) { result, error in
                    if let error = error {
                        reject(error)
                    } else if let result = result {
                        fullfill(FetchGitHubUserListUseCaseOutput(gitHubUerList: result))
                    } else {
                        reject(error!)
                    }
                }
            }
        }
    }
}
