//
//  HomeCellNode.swift
//  TestAsysn
//
//  Created by tuannv on 8/31/16.
//  Copyright © 2016 vn.test. All rights reserved.
//

//import Foundation
import AsyncDisplayKit

class HomeCellNode: ASCellNode {
    
    
    
    
    var titleLabel : ASTextNode
    var timeLabel  : ASTextNode
    var thumbnailImage : ASImageNode
    
    override init() {
        
        titleLabel = ASTextNode()
        titleLabel.flexGrow = true
        titleLabel.flexShrink = true
        titleLabel.maximumNumberOfLines = 3
        //        titleLabel.attributedString = NSAttributedString(string: sampleText)
        
        
        timeLabel = ASTextNode()
        
        
        
        thumbnailImage = ASImageNode()
        
        thumbnailImage.contentMode = .ScaleAspectFit
        thumbnailImage.flexShrink = false
        
        super.init()
        
        addSubnode(titleLabel)
        addSubnode(timeLabel)
        addSubnode(thumbnailImage)
        
        
        
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        
        let  titleInsetSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(2, 2, 2, 2), child: titleLabel)
        let vStackLayoutSpec = ASStackLayoutSpec(direction: .Vertical, spacing: 3, justifyContent: .Center, alignItems: .End, children: [titleLabel , titleInsetSpec])
        
        
        thumbnailImage.preferredFrameSize = CGSizeMake(80, 80)
        
        let thumbnailInsetSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(2, 2, 2, 2), child: thumbnailImage)
        
        let hStackLayoutSpec = ASStackLayoutSpec(direction: .Horizontal, spacing: 2, justifyContent: .Start, alignItems: .Start, children: [thumbnailInsetSpec, vStackLayoutSpec])
        
        return hStackLayoutSpec
    }
    
}
