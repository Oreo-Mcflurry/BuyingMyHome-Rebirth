import Foundation
import UIKit

public enum DesignSystem {}

// MARK: - Colors
public extension DesignSystem {
    enum Colors {
        // Primary Colors
        public static let primary = UIColor(named: "Primary") ?? .systemBlue
        public static let secondary = UIColor(named: "Secondary") ?? .systemGray
        public static let accent = UIColor(named: "Accent") ?? .systemOrange
        
        // Background Colors
        public static let background = UIColor(named: "Background") ?? .systemBackground
        public static let secondaryBackground = UIColor(named: "SecondaryBackground") ?? .secondarySystemBackground
        
        // Text Colors
        public static let textPrimary = UIColor(named: "TextPrimary") ?? .label
        public static let textSecondary = UIColor(named: "TextSecondary") ?? .secondaryLabel
        
        // Status Colors
        public static let success = UIColor(named: "Success") ?? .systemGreen
        public static let warning = UIColor(named: "Warning") ?? .systemYellow
        public static let error = UIColor(named: "Error") ?? .systemRed
    }
}

// MARK: - Images
public extension DesignSystem {
    enum Images {
        // Common Icons
        public static let home = UIImage(named: "home") ?? UIImage()
        public static let search = UIImage(named: "search") ?? UIImage()
        public static let favorite = UIImage(named: "favorite") ?? UIImage()
        public static let profile = UIImage(named: "profile") ?? UIImage()
        
        // App Specific Images
        public static let logo = UIImage(named: "logo") ?? UIImage()
        public static let placeholder = UIImage(named: "placeholder") ?? UIImage()
    }
}

// MARK: - Typography
public extension DesignSystem {
    enum Typography {
        // Headings
        public static func heading1() -> UIFont {
            return UIFont.systemFont(ofSize: 32, weight: .bold)
        }
        
        public static func heading2() -> UIFont {
            return UIFont.systemFont(ofSize: 24, weight: .bold)
        }
        
        public static func heading3() -> UIFont {
            return UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
        
        // Body Text
        public static func body() -> UIFont {
            return UIFont.systemFont(ofSize: 16, weight: .regular)
        }
        
        public static func bodyBold() -> UIFont {
            return UIFont.systemFont(ofSize: 16, weight: .semibold)
        }
        
        // Caption
        public static func caption() -> UIFont {
            return UIFont.systemFont(ofSize: 12, weight: .regular)
        }
        
        public static func captionBold() -> UIFont {
            return UIFont.systemFont(ofSize: 12, weight: .semibold)
        }
    }
}

// MARK: - Spacing
public extension DesignSystem {
    enum Spacing {
        public static let xs: CGFloat = 4
        public static let sm: CGFloat = 8
        public static let md: CGFloat = 16
        public static let lg: CGFloat = 24
        public static let xl: CGFloat = 32
        public static let xxl: CGFloat = 48
    }
}

// MARK: - Corner Radius
public extension DesignSystem {
    enum CornerRadius {
        public static let small: CGFloat = 4
        public static let medium: CGFloat = 8
        public static let large: CGFloat = 12
        public static let xlarge: CGFloat = 16
    }
} 
