//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 7 storyboards.
  struct storyboard {
    /// Storyboard `AcessTokenInput`.
    static let acessTokenInput = _R.storyboard.acessTokenInput()
    /// Storyboard `GitHubRepositoryList`.
    static let gitHubRepositoryList = _R.storyboard.gitHubRepositoryList()
    /// Storyboard `GitHubUserList`.
    static let gitHubUserList = _R.storyboard.gitHubUserList()
    /// Storyboard `GitHubUserRepository`.
    static let gitHubUserRepository = _R.storyboard.gitHubUserRepository()
    /// Storyboard `InputSearchRepositoryKeyword`.
    static let inputSearchRepositoryKeyword = _R.storyboard.inputSearchRepositoryKeyword()
    /// Storyboard `Splash`.
    static let splash = _R.storyboard.splash()
    /// Storyboard `Top`.
    static let top = _R.storyboard.top()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "AcessTokenInput", bundle: ...)`
    static func acessTokenInput(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.acessTokenInput)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "GitHubRepositoryList", bundle: ...)`
    static func gitHubRepositoryList(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.gitHubRepositoryList)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "GitHubUserList", bundle: ...)`
    static func gitHubUserList(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.gitHubUserList)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "GitHubUserRepository", bundle: ...)`
    static func gitHubUserRepository(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.gitHubUserRepository)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "InputSearchRepositoryKeyword", bundle: ...)`
    static func inputSearchRepositoryKeyword(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.inputSearchRepositoryKeyword)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Splash", bundle: ...)`
    static func splash(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.splash)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Top", bundle: ...)`
    static func top(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.top)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Splash"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 3 localization keys.
    struct localizable {
      /// Value: OK
      static let common_error_alert_button_title = Rswift.StringResource(key: "common_error_alert_button_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: 前の画面で再度検索してください。
      static let common_error_alert_message = Rswift.StringResource(key: "common_error_alert_message", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: 情報の取得に失敗しました
      static let common_error_alert_title = Rswift.StringResource(key: "common_error_alert_title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: OK
      static func common_error_alert_button_title(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("common_error_alert_button_title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "common_error_alert_button_title"
        }

        return NSLocalizedString("common_error_alert_button_title", bundle: bundle, comment: "")
      }

      /// Value: 前の画面で再度検索してください。
      static func common_error_alert_message(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("common_error_alert_message", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "common_error_alert_message"
        }

        return NSLocalizedString("common_error_alert_message", bundle: bundle, comment: "")
      }

      /// Value: 情報の取得に失敗しました
      static func common_error_alert_title(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("common_error_alert_title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "common_error_alert_title"
        }

        return NSLocalizedString("common_error_alert_title", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try acessTokenInput.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try gitHubRepositoryList.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try gitHubUserList.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try gitHubUserRepository.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try inputSearchRepositoryKeyword.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try splash.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try top.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct acessTokenInput: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = AccessTokenInputViewController

      let bundle = R.hostingBundle
      let name = "AcessTokenInput"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct gitHubRepositoryList: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = GitHubRepositoryListViewController

      let bundle = R.hostingBundle
      let name = "GitHubRepositoryList"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct gitHubUserList: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = GitHubUserListViewController

      let bundle = R.hostingBundle
      let name = "GitHubUserList"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct gitHubUserRepository: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = GitHubUserRepositoryViewController

      let bundle = R.hostingBundle
      let name = "GitHubUserRepository"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct inputSearchRepositoryKeyword: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = InputSearchRepositoryKeywordViewController

      let bundle = R.hostingBundle
      let name = "InputSearchRepositoryKeyword"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct splash: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "Splash"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct top: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = TopViewController

      let bundle = R.hostingBundle
      let name = "Top"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
