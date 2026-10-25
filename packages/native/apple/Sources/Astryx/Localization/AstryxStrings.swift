// Copyright (c) Meta Platforms, Inc. and affiliates.

import AstryxNative
import Foundation

/// Core's catalog messages, read from `Resources/<locale>.lproj`, which
/// `generate:swift-ios` writes from core's locale catalogs.
enum AstryxStrings {
  /// What a loading button says to assistive technology.
  static var buttonLoading: String { localized("@astryx.button.loading", "Loading") }
  /// What a busy input says to assistive technology when it starts loading.
  static var spinnerLoading: String { localized("@astryx.spinner.loading", "Loading") }
  /// The indicator after an optional field's label.
  static var fieldOptional: String { localized("@astryx.field.optional", "Optional") }
  /// What VoiceOver reads for a read-only field, which SwiftUI cannot mark.
  static var inputReadOnly: String { localized("@astryx.input.readOnly", "Read only") }
  /// The indicator after a required field's label.
  static var fieldRequired: String { localized("@astryx.field.required", "Required") }
  /// The hover and pointer tip on an input's clear button.
  static var clearTooltip: String { localized("@astryx.inputClearButton.tooltip", "Clear") }

  /// The clear button's accessible name, naming the field.
  static func clearLabel(_ label: String) -> String {
    localized("@astryx.textInput.clearLabel", "Clear {label}").replacingOccurrences(of: "{label}", with: label)
  }

  /// The accessible name of an input's status button when its message shows
  /// in a tip.
  static func statusButton(_ type: TextInputStatusType) -> String {
    switch type {
    case .error: localized("@astryx.input.statusButton.error", "Error details")
    case .warning: localized("@astryx.input.statusButton.warning", "Warning details")
    case .success: localized("@astryx.input.statusButton.success", "Success details")
    }
  }

  static func localized(_ key: String, _ english: String) -> String {
    resourceBundle.localizedString(forKey: key, value: english, table: nil)
  }

  static var resourceBundle: Bundle {
    #if SWIFT_PACKAGE
    Bundle.module
    #else
    Bundle.main
    #endif
  }
}
