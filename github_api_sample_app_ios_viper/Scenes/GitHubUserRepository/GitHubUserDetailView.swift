import Nuke
import SkeletonView
import UIKit

class GitHubUserDetailView: UIView {
    // MARK: - Constants

    // デザインはMaterialDesginを参考(https://material.io/components/lists)
    private let baseMargin = 16.0
    private let iconSize = 80.0
    private let upperLabelMargin = 16.0
    private let bottomLabelMagin = 20.0

    // MARK: - UIParts

    let iconImageView = UIImageView()
    let userNameLabel = UILabel()
    let userFullNameLabel = UILabel()
    let followersConuntLabel = UILabel()
    let followingCountLabel = UILabel()

    // MARK: - Outlets

    // MARK: - Variables

    // MARK: - LifeCycle Methods

    // MARK: - Actions

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initView()
    }

    func initView() {
        addSubViewUIParts()
        // すべてのパーツをaddSubviewしてから制約をつけないとクラッシュする
        initUIParts()
    }
}

// MARK: - Private Methods

extension GitHubUserDetailView {
    private func addSubViewUIParts() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userNameLabel)
        userFullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userFullNameLabel)
        followersConuntLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(followersConuntLabel)
        followingCountLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(followingCountLabel)
    }

    private func initUIParts() {
        initIconImageView()
        initUserNameLabel()
        initUserFullNameLabel()
        initFollowersConuntLabel()
        initFollowingConuntLabel()
    }

    private func initIconImageView() {
        iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: baseMargin).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: baseMargin).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: iconSize).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: iconSize).isActive = true
        iconImageView.contentMode = UIView.ContentMode.scaleToFill
        iconImageView.isSkeletonable = true
    }

    private func initUserNameLabel() {
        // skeltonを非表示にしたときに位置が大きくずれるのでtopAnchorから16ptの制約をつけた
        userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: upperLabelMargin).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: baseMargin).isActive = true
        userNameLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - userNameLabel.frame.minX - baseMargin
        userNameLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func initUserFullNameLabel() {
        userFullNameLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: baseMargin).isActive = true
        userFullNameLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: baseMargin).isActive = true
        userFullNameLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - userNameLabel.frame.minX - baseMargin
        userFullNameLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func initFollowersConuntLabel() {
        followersConuntLabel.topAnchor.constraint(equalTo: userFullNameLabel.bottomAnchor, constant: baseMargin).isActive = true
        followersConuntLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: baseMargin).isActive = true
        followersConuntLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - followersConuntLabel.frame.minX - baseMargin
        followersConuntLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func initFollowingConuntLabel() {
        followingCountLabel.topAnchor.constraint(equalTo: followersConuntLabel.bottomAnchor, constant: baseMargin).isActive = true
        followingCountLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: baseMargin).isActive = true
        followingCountLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - followingCountLabel.frame.minX - baseMargin
        followingCountLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func createUserCell(githubUserDetail: GitHubUserDetail) {
        iconImageView.hideSkeleton()
        userNameLabel.hideSkeleton()
        Nuke.loadImage(with: githubUserDetail.avatarUrl, into: iconImageView)
        userNameLabel.text = githubUserDetail.login
        userFullNameLabel.text = githubUserDetail.userFullName
        followersConuntLabel.text = String(githubUserDetail.followers)
        followingCountLabel.text = String(githubUserDetail.following)
    }
}

// MARK: - Public Methods

extension GitHubUserDetailView {
    func createCell(githubUserDetail: GitHubUserDetail) {
        createUserCell(githubUserDetail: githubUserDetail)
    }
}

// MARK: - Delegate Methods
