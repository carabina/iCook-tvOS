//
//  VideoRowContainerCell.swift
//  TryTVOS
//
//  Created by Ben on 26/02/2016.
//  Copyright © 2016 bcylin.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

class VideoRowContainerCell: UICollectionViewCell {

  var collectionView: UICollectionView?

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    clipsToBounds = false
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    clipsToBounds = false
  }

  // MARK: - UIKit

  override var preferredFocusedView: UIView? {
    return collectionView
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    collectionView?.removeFromSuperview()
    collectionView = nil
  }

  // MARK: - Public Methods

  func configure(withEmbeddedCollectionView collectionView: VideoRowCollectionView) {
    collectionView.rowContainerCell = self

    self.collectionView?.removeFromSuperview()
    self.collectionView = collectionView

    contentView.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false

    collectionView.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
    collectionView.leftAnchor.constraintEqualToAnchor(contentView.leftAnchor).active = true
    collectionView.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor).active = true
    collectionView.rightAnchor.constraintEqualToAnchor(contentView.rightAnchor).active = true
  }

}