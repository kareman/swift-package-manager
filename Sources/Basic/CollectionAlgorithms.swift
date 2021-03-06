/*
 This source file is part of the Swift.org open source project

 Copyright 2016 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

extension BidirectionalCollection where Iterator.Element : Comparable {
    /// Returns the index of the last occurrence of `element` or nil if none.
    ///
    /// - Parameters:
    ///   - start: If provided, the `start` index limits the search to a suffix of the collection.
    //
    // FIXME: This probably shouldn't take the `from` parameter, the pattern in
    // the standard library is to use slices for that.
    public func rindex(of element: Iterator.Element, from start: Index? = nil) -> Index? {
        let firstIdx = start ?? startIndex
        var i = endIndex
        while i > firstIdx {
            self.formIndex(before: &i)
            if self[i] == element {
                return i
            }
        }
        return nil
    }
}
