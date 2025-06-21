import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "BuyingMyHome",
    projects: [
        "Projects/App",
        "Projects/ThirdParty",
        "Projects/Domain",
        "Projects/Core",
        "Projects/DesignSystem",
        "Projects/Navigation",
        "Projects/Features/HomeFeature",
        "Projects/Features/SearchFeature",
        "Projects/Features/FavoriteFeature",
        "Projects/Features/ProfileFeature"
    ],
    additionalFiles: [
        "README.md",
        ".github/**"
    ]
) 