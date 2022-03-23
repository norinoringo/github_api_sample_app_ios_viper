protocol FetchGitHubUserDetailRepository {
    func fetchGitHubUserDetail(input: FetchGitHubUserDetailUseCaseInput, block: @escaping (GitHubUserDetail?, Error?) -> Void)
}
