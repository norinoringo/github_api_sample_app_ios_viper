protocol FetchGitHubUserRepositoryRepository {
    func fetchGitHubUserRepository(input: FetchGitHubUserRepositoryUseCaseInput, block: @escaping ([GitHubUserRepositry]?, Error?) -> Void)
}
