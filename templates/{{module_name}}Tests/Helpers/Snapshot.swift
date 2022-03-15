//
//  Copyright © 2021 Orange. All rights reserved.
//

import UIKit
import SnapshotTesting

private let imageDiffPrecision: Float = 0.98
private let diffTool = "code"

enum ImageSize {
    case standard
    case custom(CGSize)
    case inferFromFrame
}

func assertSnapshotImage(
    _ value: UIView,
    size: ImageSize = .standard,
    precision: Float = imageDiffPrecision,
    record: Bool = false,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line
) {
    SnapshotTesting.diffTool = diffTool

    let strategy: Snapshotting<UIView, UIImage> = Snapshotting.image(
        precision: precision,
        size: cgSize(size)
    )

    assertSnapshot(
        matching: value,
        as: strategy,
        record: record,
        file: file,
        testName: testName,
        line: line
    )
}

func assertSnapshotImage(
    _ value: UIViewController,
    size: ImageSize = .standard,
    precision: Float = imageDiffPrecision,
    record: Bool = false,
    file: StaticString = #file,
    testName: String = #function,
    line: UInt = #line
) {
    SnapshotTesting.diffTool = diffTool

    let strategy: Snapshotting<UIViewController, UIImage> = Snapshotting.image(
        precision: precision,
        size: cgSize(size)
    )

    assertSnapshot(
        matching: value,
        as: strategy,
        record: record,
        file: file,
        testName: testName,
        line: line
    )
}

private func cgSize(_ size: ImageSize) -> CGSize? {
    switch size {
    case .standard:
        return CGSize(width: 300, height: 649) // 80% of iPhone X size
    case .inferFromFrame:
        return nil
    case .custom(let size):
        return size
    }
}
