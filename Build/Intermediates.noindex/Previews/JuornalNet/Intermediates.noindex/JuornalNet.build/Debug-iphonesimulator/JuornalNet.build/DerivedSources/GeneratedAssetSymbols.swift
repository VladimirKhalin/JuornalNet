import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

    /// The "article_cell_bg" asset catalog color resource.
    static let articleCellBg = ColorResource(name: "article_cell_bg", bundle: resourceBundle)

    /// The "background" asset catalog color resource.
    static let background = ColorResource(name: "background", bundle: resourceBundle)

    /// The "bg" asset catalog color resource.
    static let bg = ColorResource(name: "bg", bundle: resourceBundle)

    /// The "card_bg" asset catalog color resource.
    static let cardBg = ColorResource(name: "card_bg", bundle: resourceBundle)

    /// The "green_bg" asset catalog color resource.
    static let greenBg = ColorResource(name: "green_bg", bundle: resourceBundle)

    /// The "red_bg" asset catalog color resource.
    static let redBg = ColorResource(name: "red_bg", bundle: resourceBundle)

    /// The "screen_bg" asset catalog color resource.
    static let screenBg = ColorResource(name: "screen_bg", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "img1" asset catalog image resource.
    static let img1 = ImageResource(name: "img1", bundle: resourceBundle)

    /// The "img2" asset catalog image resource.
    static let img2 = ImageResource(name: "img2", bundle: resourceBundle)

    /// The "img3" asset catalog image resource.
    static let img3 = ImageResource(name: "img3", bundle: resourceBundle)

    /// The "logo" asset catalog image resource.
    static let logo = ImageResource(name: "logo", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "article_cell_bg" asset catalog color.
    static var articleCellBg: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .articleCellBg)
#else
        .init()
#endif
    }

    /// The "background" asset catalog color.
    static var background: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "bg" asset catalog color.
    static var bg: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .bg)
#else
        .init()
#endif
    }

    /// The "card_bg" asset catalog color.
    static var cardBg: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cardBg)
#else
        .init()
#endif
    }

    /// The "green_bg" asset catalog color.
    static var greenBg: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .greenBg)
#else
        .init()
#endif
    }

    /// The "red_bg" asset catalog color.
    static var redBg: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .redBg)
#else
        .init()
#endif
    }

    /// The "screen_bg" asset catalog color.
    static var screenBg: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .screenBg)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "article_cell_bg" asset catalog color.
    static var articleCellBg: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .articleCellBg)
#else
        .init()
#endif
    }

    /// The "background" asset catalog color.
    static var background: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "bg" asset catalog color.
    static var bg: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .bg)
#else
        .init()
#endif
    }

    /// The "card_bg" asset catalog color.
    static var cardBg: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .cardBg)
#else
        .init()
#endif
    }

    /// The "green_bg" asset catalog color.
    static var greenBg: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .greenBg)
#else
        .init()
#endif
    }

    /// The "red_bg" asset catalog color.
    static var redBg: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .redBg)
#else
        .init()
#endif
    }

    /// The "screen_bg" asset catalog color.
    static var screenBg: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .screenBg)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// The "article_cell_bg" asset catalog color.
    static var articleCellBg: SwiftUI.Color { .init(.articleCellBg) }

    /// The "background" asset catalog color.
    static var background: SwiftUI.Color { .init(.background) }

    /// The "bg" asset catalog color.
    static var bg: SwiftUI.Color { .init(.bg) }

    /// The "card_bg" asset catalog color.
    static var cardBg: SwiftUI.Color { .init(.cardBg) }

    /// The "green_bg" asset catalog color.
    static var greenBg: SwiftUI.Color { .init(.greenBg) }

    /// The "red_bg" asset catalog color.
    static var redBg: SwiftUI.Color { .init(.redBg) }

    /// The "screen_bg" asset catalog color.
    static var screenBg: SwiftUI.Color { .init(.screenBg) }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "article_cell_bg" asset catalog color.
    static var articleCellBg: SwiftUI.Color { .init(.articleCellBg) }

    /// The "background" asset catalog color.
    static var background: SwiftUI.Color { .init(.background) }

    /// The "bg" asset catalog color.
    static var bg: SwiftUI.Color { .init(.bg) }

    /// The "card_bg" asset catalog color.
    static var cardBg: SwiftUI.Color { .init(.cardBg) }

    /// The "green_bg" asset catalog color.
    static var greenBg: SwiftUI.Color { .init(.greenBg) }

    /// The "red_bg" asset catalog color.
    static var redBg: SwiftUI.Color { .init(.redBg) }

    /// The "screen_bg" asset catalog color.
    static var screenBg: SwiftUI.Color { .init(.screenBg) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "img1" asset catalog image.
    static var img1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .img1)
#else
        .init()
#endif
    }

    /// The "img2" asset catalog image.
    static var img2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .img2)
#else
        .init()
#endif
    }

    /// The "img3" asset catalog image.
    static var img3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .img3)
#else
        .init()
#endif
    }

    /// The "logo" asset catalog image.
    static var logo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .logo)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "img1" asset catalog image.
    static var img1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .img1)
#else
        .init()
#endif
    }

    /// The "img2" asset catalog image.
    static var img2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .img2)
#else
        .init()
#endif
    }

    /// The "img3" asset catalog image.
    static var img3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .img3)
#else
        .init()
#endif
    }

    /// The "logo" asset catalog image.
    static var logo: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .logo)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ColorResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
@available(watchOS, unavailable)
extension ImageResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif