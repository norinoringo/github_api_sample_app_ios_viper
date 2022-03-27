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
    let repository: FetchGitHubUserDetailRepository

    init(repository: FetchGitHubUserDetailRepository) {
        self.repository = repository
    }

    func fetchGitHubUserList(input: FetchGitHubUserDetailUseCaseInput) -> Promise<FetchGitHubUserDetailUseCaseOutput> {
        return Promise<FetchGitHubUserDetailUseCaseOutput>(on: .main) { fullfill, reject in
            self.repository.fetchGitHubUserDetail(input: input) { result, error in
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
