//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Collections open source project
//
// Copyright (c) 2021 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

extension PriorityQueue {

  /// A view of a `PriorityQueue`'s elements, as a `Sequence` from the element
  /// with the lowest priority to the highest.
  public struct AscendingView: Sequence, IteratorProtocol {
    /// The source priority queue.
    @usableFromInline
    internal var _base: PriorityQueue

    /// Creates an ascending-element view from the given priority queue.
    @usableFromInline
    internal init(_ base: PriorityQueue) { _base = base }

    @inlinable
    public mutating func next() -> Element? { return _base.popMin() }

    @inlinable
    public var underestimatedCount: Int { _base.count }

    @inlinable
    public func _customContainsEquatableElement(_ element: Element) -> Bool? {
      return _base.contains(element)
    }
  }

  /// A view of a `PriorityQueue`'s elements, as a `Sequence` from the element
  /// with the highest priority to the lowest.
  public struct DescendingView: Sequence, IteratorProtocol {
    /// The source priority queue.
    @usableFromInline
    internal var _base: PriorityQueue

    /// Creates a descending-element view from the given priority queue.
    @usableFromInline
    internal init(_ base: PriorityQueue) { _base = base }

    @inlinable
    public mutating func next() -> Element? { return _base.popMax() }

    @inlinable
    public var underestimatedCount: Int { _base.count }

    @inlinable
    public func _customContainsEquatableElement(_ element: Element) -> Bool? {
      return _base.contains(element)
    }
  }

  /// Returns an iterator that orders elements from lowest to highest priority
  @inlinable
  public var ascending: AscendingView {
    return AscendingView(self)
  }

  /// Returns an iterator that orders elements from highest to lowest priority
  @inlinable
  public var descending: DescendingView {
    return DescendingView(self)
  }
}
