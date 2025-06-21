import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .core(name: "Domain"),
    dependencies: [
        .thirdParty
    ]
) 