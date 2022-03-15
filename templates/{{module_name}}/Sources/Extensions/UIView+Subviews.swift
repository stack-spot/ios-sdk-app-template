//
//  Copyright © 2021 Orange. All rights reserved.
//

import UIKit

public extension UIView {

    @discardableResult
    func subviews(
        @SubviewsBuilder
        _ subviews: () -> [UIView]
    ) -> UIView {
        subviews().forEach { self.customAddSubview($0) }
        return self
    }

    private func customAddSubview(_ view: UIView) {
        if let stack = self as? UIStackView {
            stack.addArrangedSubview(view)
        } else {
            self.addSubview(view)
        }
    }
}

@_functionBuilder
public struct SubviewsBuilder {
    public static func buildBlock(_ children: UIView...) -> [UIView] {
        return children
    }
}
