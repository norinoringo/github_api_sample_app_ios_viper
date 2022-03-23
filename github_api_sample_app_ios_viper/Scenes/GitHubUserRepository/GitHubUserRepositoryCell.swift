import Nuke
import SkeletonView
import UIKit

class GitHubUserRepositoryCell: UITableViewCell {
    // MARK: - Constants

    // デザインはMaterialDesginを参考(https://material.io/components/lists)
    private let baseMargin = 16.0
    private let upperLabelMargin = 16.0

    // MARK: - UIParts

    let repositoryNameLabel = UILabel()
    let programingLanguageLabel = UILabel()
    let starCountLabel = UILabel()
    let repositoryDetailLabel = UILabel()

    // MARK: - Outlets

    // MARK: - Variables

    // MARK: - LifeCycle Methods

    // MARK: - Actions

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewUIParts()
        // すべてのパーツをaddSubviewしてから制約をつけないとクラッシュする
        initUIParts()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // セルの再利用するときにセルの初期化に関する処理をここに書く
    }
}

// MARK: - Private Methods

extension GitHubUserRepositoryCell {
    private func addSubViewUIParts() {
        repositoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(repositoryNameLabel)
        programingLanguageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(programingLanguageLabel)
        starCountLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(starCountLabel)
        repositoryDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(repositoryDetailLabel)
    }

    private func initUIParts() {
        initRepositoryCountLabel()
        initProgramingLanguageLabel()
        initStarCountLabel()
        initRepositoryDetailLabel()
    }

    private func initRepositoryCountLabel() {
        // skeltonを非表示にしたときに位置が大きくずれるのでtopAnchorから16ptの制約をつけた
        repositoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: upperLabelMargin).isActive = true
        repositoryNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: baseMargin).isActive = true
        repositoryNameLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - repositoryNameLabel.frame.minX - baseMargin
        repositoryNameLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func initProgramingLanguageLabel() {
        // skeltonを非表示にしたときに位置が大きくずれるのでtopAnchorから16ptの制約をつけた
        programingLanguageLabel.topAnchor.constraint(equalTo: repositoryNameLabel.bottomAnchor, constant: upperLabelMargin).isActive = true
        programingLanguageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: baseMargin).isActive = true
        programingLanguageLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - programingLanguageLabel.frame.minX - baseMargin
        programingLanguageLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func initStarCountLabel() {
        // skeltonを非表示にしたときに位置が大きくずれるのでtopAnchorから16ptの制約をつけた
        starCountLabel.topAnchor.constraint(equalTo: programingLanguageLabel.bottomAnchor, constant: upperLabelMargin).isActive = true
        starCountLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: baseMargin).isActive = true
        starCountLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - starCountLabel.frame.minX - baseMargin
        starCountLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func initRepositoryDetailLabel() {
        // skeltonを非表示にしたときに位置が大きくずれるのでtopAnchorから16ptの制約をつけた
        repositoryDetailLabel.topAnchor.constraint(equalTo: starCountLabel.bottomAnchor, constant: upperLabelMargin).isActive = true
        repositoryDetailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: baseMargin).isActive = true
        let repositoryDetailLabelBottomAnchor = repositoryDetailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -baseMargin)
        repositoryDetailLabelBottomAnchor.priority = .defaultLow
        repositoryDetailLabelBottomAnchor.isActive = true
        repositoryDetailLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - repositoryDetailLabel.frame.minX - baseMargin
        repositoryDetailLabel.widthAnchor.constraint(equalToConstant: width).isActive = true

        repositoryDetailLabel.numberOfLines = 0
    }

    private func createUserRepositoryCell(githubUserRepository: GitHubUserRepositry) {
        repositoryNameLabel.text = githubUserRepository.repositoryName
        programingLanguageLabel.text = githubUserRepository.language
        starCountLabel.text = String(githubUserRepository.stargazersCount)
        repositoryDetailLabel.text = githubUserRepository.description
    }
}

// MARK: - Public Methods

extension GitHubUserRepositoryCell {
    func createCell(githubUserRepository: GitHubUserRepositry) {
        createUserRepositoryCell(githubUserRepository: githubUserRepository)
    }
}

// MARK: - Delegate Methods
