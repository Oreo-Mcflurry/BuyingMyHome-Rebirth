import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .designSystem(name: "DesignSystem"),
    dependencies: [
        .thirdParty
    ]
) 