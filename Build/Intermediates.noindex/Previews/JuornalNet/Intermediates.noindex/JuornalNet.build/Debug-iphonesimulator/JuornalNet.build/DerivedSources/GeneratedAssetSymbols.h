#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"VK.JuornalNet";

/// The "article_cell_bg" asset catalog color resource.
static NSString * const ACColorNameArticleCellBg AC_SWIFT_PRIVATE = @"article_cell_bg";

/// The "background" asset catalog color resource.
static NSString * const ACColorNameBackground AC_SWIFT_PRIVATE = @"background";

/// The "bg" asset catalog color resource.
static NSString * const ACColorNameBg AC_SWIFT_PRIVATE = @"bg";

/// The "card_bg" asset catalog color resource.
static NSString * const ACColorNameCardBg AC_SWIFT_PRIVATE = @"card_bg";

/// The "green_bg" asset catalog color resource.
static NSString * const ACColorNameGreenBg AC_SWIFT_PRIVATE = @"green_bg";

/// The "red_bg" asset catalog color resource.
static NSString * const ACColorNameRedBg AC_SWIFT_PRIVATE = @"red_bg";

/// The "screen_bg" asset catalog color resource.
static NSString * const ACColorNameScreenBg AC_SWIFT_PRIVATE = @"screen_bg";

/// The "img1" asset catalog image resource.
static NSString * const ACImageNameImg1 AC_SWIFT_PRIVATE = @"img1";

/// The "img2" asset catalog image resource.
static NSString * const ACImageNameImg2 AC_SWIFT_PRIVATE = @"img2";

/// The "img3" asset catalog image resource.
static NSString * const ACImageNameImg3 AC_SWIFT_PRIVATE = @"img3";

/// The "logo" asset catalog image resource.
static NSString * const ACImageNameLogo AC_SWIFT_PRIVATE = @"logo";

#undef AC_SWIFT_PRIVATE