import Foundation
import Promises

struct FetchGitHubUserDetailUseCaseInput {
    let accessToken: String
    let githubUser: GitHubUser
}

struct FetchGitHubUserDetailUseCaseOutput {
    let gitHubUerDetail: GitHubUserDetail
}

class FetchGitHubUserDetailUseCase {
    let repository: FetchGitHubAPIClientRepository

    init(repository: FetchGitHubAPIClientRepository) {
        self.repository = repository
    }

    func fetchGitHubUserList(input: FetchGitHubUserDetailUseCaseInput) -> Promise<FetchGitHubUserDetailUseCaseOutput> {
        return Promise<FetchGitHubUserDetailUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            self.repository.fetchGitHubUserDetail(input: input) { result, error in
                DispatchQueue.main.async {
                    if let error = error {
                        reject(error)
                    } else if let result = result {
                        fullfill(FetchGitHubUserDetailUseCaseOutput(gitHubUerDetail: result))
                    } else {
                        reject(GitHubClientError.unkownError)
                    }
                }
            }
        }
    }
}
