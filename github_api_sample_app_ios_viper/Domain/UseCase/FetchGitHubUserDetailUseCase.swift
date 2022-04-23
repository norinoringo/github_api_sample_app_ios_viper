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

    func fetchGitHubUserDetail(input: FetchGitHubUserDetailUseCaseInput) -> Promise<FetchGitHubUserDetailUseCaseOutput> {
        return Promise<FetchGitHubUserDetailUseCaseOutput>(on: .global(qos: .background)) { fullfill, reject in
            self.repository.fetchGitHubUserDetail(input: input) { result in
                DispatchQueue.main.async {
                    switch result {
                    case let .failure(error):
                        reject(error)
                    case let .success(result):
                        fullfill(FetchGitHubUserDetailUseCaseOutput(gitHubUerDetail: result))
                    }
                }
            }
        }
    }
}
