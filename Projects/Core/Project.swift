import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .core(name: "Core"),
    dependencies: [
        .thirdParty
    ]
) 