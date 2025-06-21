import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .shared(name: "ThirdParty"),
    dependencies: [
        .external(name: "RxSwift"),
        .external(name: "RxCocoa"),
        .external(name: "RxRelay"),
        .external(name: "RxFlow")
    ]
) 