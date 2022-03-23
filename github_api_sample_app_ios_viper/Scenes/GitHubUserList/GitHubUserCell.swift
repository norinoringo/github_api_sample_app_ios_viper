import Nuke
import SkeletonView
import UIKit

class GitHubUserCell: UITableViewCell {
    // MARK: - Constants

    // デザインはMaterialDesginを参考(https://material.io/components/lists)
    private let baseMargin = 16.0
    private let iconSize = 40.0
    private let upperLabelMargin = 16.0
    private let bottomLabelMagin = 20.0
    // UIParts
    let iconImageView = UIImageView()
    let nameLabel = UILabel()

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

extension GitHubUserCell {
    private func addSubViewUIParts() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconImageView)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
    }

    private func initUIParts() {
        initIconImageView()
        initNameLabel()
    }

    private func initIconImageView() {
        iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: baseMargin).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: baseMargin).isActive = true
        // tableViewCellはBoarder線の分高さが伸びるので、BottomAnchorの制約は緩める必要がある
        let iconBottomAnchor = iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -baseMargin)
        iconBottomAnchor.priority = .defaultLow
        iconBottomAnchor.isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: iconSize).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: iconSize).isActive = true

        iconImageView.contentMode = UIView.ContentMode.scaleToFill
        iconImageView.clipsToBounds = true
        iconImageView.isSkeletonable = true
    }

    private func initNameLabel() {
        // skeltonを非表示にしたときに位置が大きくずれるのでtopAnchorから16ptの制約をつけた
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: upperLabelMargin).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: baseMargin).isActive = true
        nameLabel.isSkeletonable = true
        // UIパーツのwidthを設定しないとskeltonが表示されないので対応した
        let width = frame.width - nameLabel.frame.minX - baseMargin
        nameLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    private func createUserCell(githubUser: GitHubUser) {
        iconImageView.hideSkeleton()
        nameLabel.hideSkeleton()
        Nuke.loadImage(with: githubUser.avatarUrl, into: iconImageView)
        nameLabel.text = githubUser.login
    }
}

// MARK: - Public Methods

extension GitHubUserCell {
    func createCell(githubUser: GitHubUser) {
        createUserCell(githubUser: githubUser)
    }
}

// MARK: - Delegate Methods
