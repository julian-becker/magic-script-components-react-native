// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 3.5.0

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
import UIKit
import ARKit
import SceneKit
import AVKit
@testable import RNMagicScriptHostApplication


// MARK: - AVPlayerProtocol
open class AVPlayerProtocolMock: AVPlayerProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var currentItem: AVPlayerItem? {
		get {	invocations.append(.p_currentItem_get); return __p_currentItem ?? optionalGivenGetterValue(.p_currentItem_get, "AVPlayerProtocolMock - stub value for currentItem was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_currentItem = newValue }
	}
	private var __p_currentItem: (AVPlayerItem)?

    public var volume: Float {
		get {	invocations.append(.p_volume_get); return __p_volume ?? givenGetterValue(.p_volume_get, "AVPlayerProtocolMock - stub value for volume was not defined") }
		set {	invocations.append(.p_volume_set(.value(newValue))); __p_volume = newValue }
	}
	private var __p_volume: (Float)?





    open func play() {
        addInvocation(.m_play)
		let perform = methodPerformValue(.m_play) as? () -> Void
		perform?()
    }

    open func pause() {
        addInvocation(.m_pause)
		let perform = methodPerformValue(.m_pause) as? () -> Void
		perform?()
    }

    open func seek(to time: CMTime) {
        addInvocation(.m_seek__to_time(Parameter<CMTime>.value(`time`)))
		let perform = methodPerformValue(.m_seek__to_time(Parameter<CMTime>.value(`time`))) as? (CMTime) -> Void
		perform?(`time`)
    }


    fileprivate enum MethodType {
        case m_play
        case m_pause
        case m_seek__to_time(Parameter<CMTime>)
        case p_currentItem_get
        case p_volume_get
		case p_volume_set(Parameter<Float>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_play, .m_play):
                return true 
            case (.m_pause, .m_pause):
                return true 
            case (.m_seek__to_time(let lhsTime), .m_seek__to_time(let rhsTime)):
                guard Parameter.compare(lhs: lhsTime, rhs: rhsTime, with: matcher) else { return false } 
                return true 
            case (.p_currentItem_get,.p_currentItem_get): return true
            case (.p_volume_get,.p_volume_get): return true
			case (.p_volume_set(let left),.p_volume_set(let right)): return Parameter<Float>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_play: return 0
            case .m_pause: return 0
            case let .m_seek__to_time(p0): return p0.intValue
            case .p_currentItem_get: return 0
            case .p_volume_get: return 0
			case .p_volume_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func currentItem(getter defaultValue: AVPlayerItem?...) -> PropertyStub {
            return Given(method: .p_currentItem_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func volume(getter defaultValue: Float...) -> PropertyStub {
            return Given(method: .p_volume_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func play() -> Verify { return Verify(method: .m_play)}
        public static func pause() -> Verify { return Verify(method: .m_pause)}
        public static func seek(to time: Parameter<CMTime>) -> Verify { return Verify(method: .m_seek__to_time(`time`))}
        public static var currentItem: Verify { return Verify(method: .p_currentItem_get) }
        public static var volume: Verify { return Verify(method: .p_volume_get) }
		public static func volume(set newValue: Parameter<Float>) -> Verify { return Verify(method: .p_volume_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func play(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_play, performs: perform)
        }
        public static func pause(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_pause, performs: perform)
        }
        public static func seek(to time: Parameter<CMTime>, perform: @escaping (CMTime) -> Void) -> Perform {
            return Perform(method: .m_seek__to_time(`time`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - BoundsClipping
open class BoundsClippingMock: BoundsClipping, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getClippingPlanesAsVector4() -> [SCNVector4] {
        addInvocation(.m_getClippingPlanesAsVector4)
		let perform = methodPerformValue(.m_getClippingPlanesAsVector4) as? () -> Void
		perform?()
		var __value: [SCNVector4]
		do {
		    __value = try methodReturnValue(.m_getClippingPlanesAsVector4).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getClippingPlanesAsVector4(). Use given")
			Failure("Stub return value not specified for getClippingPlanesAsVector4(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getClippingPlanesAsVector4

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getClippingPlanesAsVector4, .m_getClippingPlanesAsVector4):
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getClippingPlanesAsVector4: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getClippingPlanesAsVector4(willReturn: [SCNVector4]...) -> MethodStub {
            return Given(method: .m_getClippingPlanesAsVector4, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getClippingPlanesAsVector4(willProduce: (Stubber<[SCNVector4]>) -> Void) -> MethodStub {
            let willReturn: [[SCNVector4]] = []
			let given: Given = { return Given(method: .m_getClippingPlanesAsVector4, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([SCNVector4]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getClippingPlanesAsVector4() -> Verify { return Verify(method: .m_getClippingPlanesAsVector4)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getClippingPlanesAsVector4(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getClippingPlanesAsVector4, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - BoundsClippingManaging
open class BoundsClippingManagingMock: BoundsClippingManaging, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var isUpdateClippingNeeded: Bool {
		get {	invocations.append(.p_isUpdateClippingNeeded_get); return __p_isUpdateClippingNeeded ?? givenGetterValue(.p_isUpdateClippingNeeded_get, "BoundsClippingManagingMock - stub value for isUpdateClippingNeeded was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_isUpdateClippingNeeded = newValue }
	}
	private var __p_isUpdateClippingNeeded: (Bool)?





    open func invalidateClipping() {
        addInvocation(.m_invalidateClipping)
		let perform = methodPerformValue(.m_invalidateClipping) as? () -> Void
		perform?()
    }

    open func updateClipping(for node: SCNNode?, recursive: Bool) {
        addInvocation(.m_updateClipping__for_noderecursive_recursive(Parameter<SCNNode?>.value(`node`), Parameter<Bool>.value(`recursive`)))
		let perform = methodPerformValue(.m_updateClipping__for_noderecursive_recursive(Parameter<SCNNode?>.value(`node`), Parameter<Bool>.value(`recursive`))) as? (SCNNode?, Bool) -> Void
		perform?(`node`, `recursive`)
    }


    fileprivate enum MethodType {
        case m_invalidateClipping
        case m_updateClipping__for_noderecursive_recursive(Parameter<SCNNode?>, Parameter<Bool>)
        case p_isUpdateClippingNeeded_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_invalidateClipping, .m_invalidateClipping):
                return true 
            case (.m_updateClipping__for_noderecursive_recursive(let lhsNode, let lhsRecursive), .m_updateClipping__for_noderecursive_recursive(let rhsNode, let rhsRecursive)):
                guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsRecursive, rhs: rhsRecursive, with: matcher) else { return false } 
                return true 
            case (.p_isUpdateClippingNeeded_get,.p_isUpdateClippingNeeded_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_invalidateClipping: return 0
            case let .m_updateClipping__for_noderecursive_recursive(p0, p1): return p0.intValue + p1.intValue
            case .p_isUpdateClippingNeeded_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func isUpdateClippingNeeded(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_isUpdateClippingNeeded_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func invalidateClipping() -> Verify { return Verify(method: .m_invalidateClipping)}
        public static func updateClipping(for node: Parameter<SCNNode?>, recursive: Parameter<Bool>) -> Verify { return Verify(method: .m_updateClipping__for_noderecursive_recursive(`node`, `recursive`))}
        public static var isUpdateClippingNeeded: Verify { return Verify(method: .p_isUpdateClippingNeeded_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func invalidateClipping(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_invalidateClipping, performs: perform)
        }
        public static func updateClipping(for node: Parameter<SCNNode?>, recursive: Parameter<Bool>, perform: @escaping (SCNNode?, Bool) -> Void) -> Perform {
            return Perform(method: .m_updateClipping__for_noderecursive_recursive(`node`, `recursive`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - ColorPickerDataProviding
open class ColorPickerDataProvidingMock: ColorPickerDataProviding, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var colorPickerValue: UIColor {
		get {	invocations.append(.p_colorPickerValue_get); return __p_colorPickerValue ?? givenGetterValue(.p_colorPickerValue_get, "ColorPickerDataProvidingMock - stub value for colorPickerValue was not defined") }
		set {	invocations.append(.p_colorPickerValue_set(.value(newValue))); __p_colorPickerValue = newValue }
	}
	private var __p_colorPickerValue: (UIColor)?





    open func colorChanged() {
        addInvocation(.m_colorChanged)
		let perform = methodPerformValue(.m_colorChanged) as? () -> Void
		perform?()
    }

    open func colorConfirmed() {
        addInvocation(.m_colorConfirmed)
		let perform = methodPerformValue(.m_colorConfirmed) as? () -> Void
		perform?()
    }

    open func colorCanceled() {
        addInvocation(.m_colorCanceled)
		let perform = methodPerformValue(.m_colorCanceled) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_colorChanged
        case m_colorConfirmed
        case m_colorCanceled
        case p_colorPickerValue_get
		case p_colorPickerValue_set(Parameter<UIColor>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_colorChanged, .m_colorChanged):
                return true 
            case (.m_colorConfirmed, .m_colorConfirmed):
                return true 
            case (.m_colorCanceled, .m_colorCanceled):
                return true 
            case (.p_colorPickerValue_get,.p_colorPickerValue_get): return true
			case (.p_colorPickerValue_set(let left),.p_colorPickerValue_set(let right)): return Parameter<UIColor>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_colorChanged: return 0
            case .m_colorConfirmed: return 0
            case .m_colorCanceled: return 0
            case .p_colorPickerValue_get: return 0
			case .p_colorPickerValue_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func colorPickerValue(getter defaultValue: UIColor...) -> PropertyStub {
            return Given(method: .p_colorPickerValue_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func colorChanged() -> Verify { return Verify(method: .m_colorChanged)}
        public static func colorConfirmed() -> Verify { return Verify(method: .m_colorConfirmed)}
        public static func colorCanceled() -> Verify { return Verify(method: .m_colorCanceled)}
        public static var colorPickerValue: Verify { return Verify(method: .p_colorPickerValue_get) }
		public static func colorPickerValue(set newValue: Parameter<UIColor>) -> Verify { return Verify(method: .p_colorPickerValue_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func colorChanged(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_colorChanged, performs: perform)
        }
        public static func colorConfirmed(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_colorConfirmed, performs: perform)
        }
        public static func colorCanceled(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_colorCanceled, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - DataProviding
open class DataProvidingMock: DataProviding, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }






    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - DatePickerDataProviding
open class DatePickerDataProvidingMock: DatePickerDataProviding, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var datePickerValue: Date {
		get {	invocations.append(.p_datePickerValue_get); return __p_datePickerValue ?? givenGetterValue(.p_datePickerValue_get, "DatePickerDataProvidingMock - stub value for datePickerValue was not defined") }
		set {	invocations.append(.p_datePickerValue_set(.value(newValue))); __p_datePickerValue = newValue }
	}
	private var __p_datePickerValue: (Date)?





    open func dateChanged() {
        addInvocation(.m_dateChanged)
		let perform = methodPerformValue(.m_dateChanged) as? () -> Void
		perform?()
    }

    open func dateConfirmed() {
        addInvocation(.m_dateConfirmed)
		let perform = methodPerformValue(.m_dateConfirmed) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_dateChanged
        case m_dateConfirmed
        case p_datePickerValue_get
		case p_datePickerValue_set(Parameter<Date>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_dateChanged, .m_dateChanged):
                return true 
            case (.m_dateConfirmed, .m_dateConfirmed):
                return true 
            case (.p_datePickerValue_get,.p_datePickerValue_get): return true
			case (.p_datePickerValue_set(let left),.p_datePickerValue_set(let right)): return Parameter<Date>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_dateChanged: return 0
            case .m_dateConfirmed: return 0
            case .p_datePickerValue_get: return 0
			case .p_datePickerValue_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func datePickerValue(getter defaultValue: Date...) -> PropertyStub {
            return Given(method: .p_datePickerValue_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func dateChanged() -> Verify { return Verify(method: .m_dateChanged)}
        public static func dateConfirmed() -> Verify { return Verify(method: .m_dateConfirmed)}
        public static var datePickerValue: Verify { return Verify(method: .p_datePickerValue_get) }
		public static func datePickerValue(set newValue: Parameter<Date>) -> Verify { return Verify(method: .p_datePickerValue_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func dateChanged(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_dateChanged, performs: perform)
        }
        public static func dateConfirmed(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_dateConfirmed, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - DateTimeConverting
open class DateTimeConvertingMock: DateTimeConverting, Mock, StaticMock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }
    static var matcher: Matcher = Matcher.default
    static var stubbingPolicy: StubbingPolicy = .wrap
    static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    public typealias StaticPropertyStub = StaticGiven
    public typealias StaticMethodStub = StaticGiven
    
    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public static func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    public static func from(string: String, format: String) -> Date {
        addInvocation(.sm_from__string_stringformat_format(Parameter<String>.value(`string`), Parameter<String>.value(`format`)))
		let perform = methodPerformValue(.sm_from__string_stringformat_format(Parameter<String>.value(`string`), Parameter<String>.value(`format`))) as? (String, String) -> Void
		perform?(`string`, `format`)
		var __value: Date
		do {
		    __value = try methodReturnValue(.sm_from__string_stringformat_format(Parameter<String>.value(`string`), Parameter<String>.value(`format`))).casted()
		} catch {
			Failure("Stub return value not specified for from(string: String, format: String). Use given")
		}
		return __value
    }

    open func toString(format: String) -> String {
        addInvocation(.m_toString__format_format(Parameter<String>.value(`format`)))
		let perform = methodPerformValue(.m_toString__format_format(Parameter<String>.value(`format`))) as? (String) -> Void
		perform?(`format`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_toString__format_format(Parameter<String>.value(`format`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for toString(format: String). Use given")
			Failure("Stub return value not specified for toString(format: String). Use given")
		}
		return __value
    }

    fileprivate enum StaticMethodType {
        case sm_from__string_stringformat_format(Parameter<String>, Parameter<String>)

        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.sm_from__string_stringformat_format(let lhsString, let lhsFormat), .sm_from__string_stringformat_format(let rhsString, let rhsFormat)):
                guard Parameter.compare(lhs: lhsString, rhs: rhsString, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsFormat, rhs: rhsFormat, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sm_from__string_stringformat_format(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class StaticGiven: StubbedMethod {
        fileprivate var method: StaticMethodType

        private init(method: StaticMethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func from(string: Parameter<String>, format: Parameter<String>, willReturn: Date...) -> StaticMethodStub {
            return StaticGiven(method: .sm_from__string_stringformat_format(`string`, `format`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func from(string: Parameter<String>, format: Parameter<String>, willProduce: (Stubber<Date>) -> Void) -> StaticMethodStub {
            let willReturn: [Date] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_from__string_stringformat_format(`string`, `format`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Date).self)
			willProduce(stubber)
			return given
        }
    }

    public struct StaticVerify {
        fileprivate var method: StaticMethodType

        public static func from(string: Parameter<String>, format: Parameter<String>) -> StaticVerify { return StaticVerify(method: .sm_from__string_stringformat_format(`string`, `format`))}
    }

    public struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        public static func from(string: Parameter<String>, format: Parameter<String>, perform: @escaping (String, String) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_from__string_stringformat_format(`string`, `format`), performs: perform)
        }
    }

    
    fileprivate enum MethodType {
        case m_toString__format_format(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_toString__format_format(let lhsFormat), .m_toString__format_format(let rhsFormat)):
                guard Parameter.compare(lhs: lhsFormat, rhs: rhsFormat, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_toString__format_format(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func toString(format: Parameter<String>, willReturn: String...) -> MethodStub {
            return Given(method: .m_toString__format_format(`format`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func toString(format: Parameter<String>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_toString__format_format(`format`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func toString(format: Parameter<String>) -> Verify { return Verify(method: .m_toString__format_format(`format`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func toString(format: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_toString__format_format(`format`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }
    static private func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }
    static private func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            Failure(message)
        }
    }
    static private func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
}

// MARK: - DialogPresenting
open class DialogPresentingMock: DialogPresenting, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func present(_ dialog: DialogDataProviding) {
        addInvocation(.m_present__dialog(Parameter<DialogDataProviding>.value(`dialog`)))
		let perform = methodPerformValue(.m_present__dialog(Parameter<DialogDataProviding>.value(`dialog`))) as? (DialogDataProviding) -> Void
		perform?(`dialog`)
    }

    open func dismiss(_ dialog: DialogDataProviding) {
        addInvocation(.m_dismiss__dialog(Parameter<DialogDataProviding>.value(`dialog`)))
		let perform = methodPerformValue(.m_dismiss__dialog(Parameter<DialogDataProviding>.value(`dialog`))) as? (DialogDataProviding) -> Void
		perform?(`dialog`)
    }


    fileprivate enum MethodType {
        case m_present__dialog(Parameter<DialogDataProviding>)
        case m_dismiss__dialog(Parameter<DialogDataProviding>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_present__dialog(let lhsDialog), .m_present__dialog(let rhsDialog)):
                guard Parameter.compare(lhs: lhsDialog, rhs: rhsDialog, with: matcher) else { return false } 
                return true 
            case (.m_dismiss__dialog(let lhsDialog), .m_dismiss__dialog(let rhsDialog)):
                guard Parameter.compare(lhs: lhsDialog, rhs: rhsDialog, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_present__dialog(p0): return p0.intValue
            case let .m_dismiss__dialog(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func present(_ dialog: Parameter<DialogDataProviding>) -> Verify { return Verify(method: .m_present__dialog(`dialog`))}
        public static func dismiss(_ dialog: Parameter<DialogDataProviding>) -> Verify { return Verify(method: .m_dismiss__dialog(`dialog`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func present(_ dialog: Parameter<DialogDataProviding>, perform: @escaping (DialogDataProviding) -> Void) -> Perform {
            return Perform(method: .m_present__dialog(`dialog`), performs: perform)
        }
        public static func dismiss(_ dialog: Parameter<DialogDataProviding>, perform: @escaping (DialogDataProviding) -> Void) -> Perform {
            return Perform(method: .m_dismiss__dialog(`dialog`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - Downloading
open class DownloadingMock: Downloading, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func download(remoteURL: URL, completion: @escaping (_ localURL: URL?) -> (Void)) {
        addInvocation(.m_download__remoteURL_remoteURLcompletion_completion(Parameter<URL>.value(`remoteURL`), Parameter<(_ localURL: URL?) -> (Void)>.value(`completion`)))
		let perform = methodPerformValue(.m_download__remoteURL_remoteURLcompletion_completion(Parameter<URL>.value(`remoteURL`), Parameter<(_ localURL: URL?) -> (Void)>.value(`completion`))) as? (URL, @escaping (_ localURL: URL?) -> (Void)) -> Void
		perform?(`remoteURL`, `completion`)
    }


    fileprivate enum MethodType {
        case m_download__remoteURL_remoteURLcompletion_completion(Parameter<URL>, Parameter<(_ localURL: URL?) -> (Void)>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_download__remoteURL_remoteURLcompletion_completion(let lhsRemoteurl, let lhsCompletion), .m_download__remoteURL_remoteURLcompletion_completion(let rhsRemoteurl, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsRemoteurl, rhs: rhsRemoteurl, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_download__remoteURL_remoteURLcompletion_completion(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func download(remoteURL: Parameter<URL>, completion: Parameter<(_ localURL: URL?) -> (Void)>) -> Verify { return Verify(method: .m_download__remoteURL_remoteURLcompletion_completion(`remoteURL`, `completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func download(remoteURL: Parameter<URL>, completion: Parameter<(_ localURL: URL?) -> (Void)>, perform: @escaping (URL, @escaping (_ localURL: URL?) -> (Void)) -> Void) -> Perform {
            return Perform(method: .m_download__remoteURL_remoteURLcompletion_completion(`remoteURL`, `completion`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - DragGestureRecognizing
open class DragGestureRecognizingMock: NSObject, DragGestureRecognizing, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var dragNode: Dragging? {
		get {	invocations.append(.p_dragNode_get); return __p_dragNode ?? optionalGivenGetterValue(.p_dragNode_get, "DragGestureRecognizingMock - stub value for dragNode was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_dragNode = newValue }
	}
	private var __p_dragNode: (Dragging)?

    public var beginPoint: SCNVector3 {
		get {	invocations.append(.p_beginPoint_get); return __p_beginPoint ?? givenGetterValue(.p_beginPoint_get, "DragGestureRecognizingMock - stub value for beginPoint was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_beginPoint = newValue }
	}
	private var __p_beginPoint: (SCNVector3)?

    public var dragAxis: Ray? {
		get {	invocations.append(.p_dragAxis_get); return __p_dragAxis ?? optionalGivenGetterValue(.p_dragAxis_get, "DragGestureRecognizingMock - stub value for dragAxis was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_dragAxis = newValue }
	}
	private var __p_dragAxis: (Ray)?

    public var beginDragValue: CGFloat {
		get {	invocations.append(.p_beginDragValue_get); return __p_beginDragValue ?? givenGetterValue(.p_beginDragValue_get, "DragGestureRecognizingMock - stub value for beginDragValue was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_beginDragValue = newValue }
	}
	private var __p_beginDragValue: (CGFloat)?

    public var dragDelta: CGFloat {
		get {	invocations.append(.p_dragDelta_get); return __p_dragDelta ?? givenGetterValue(.p_dragDelta_get, "DragGestureRecognizingMock - stub value for dragDelta was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_dragDelta = newValue }
	}
	private var __p_dragDelta: (CGFloat)?

    public var state: UIGestureRecognizer.State {
		get {	invocations.append(.p_state_get); return __p_state ?? givenGetterValue(.p_state_get, "DragGestureRecognizingMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (UIGestureRecognizer.State)?






    fileprivate enum MethodType {
        case p_dragNode_get
        case p_beginPoint_get
        case p_dragAxis_get
        case p_beginDragValue_get
        case p_dragDelta_get
        case p_state_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_dragNode_get,.p_dragNode_get): return true
            case (.p_beginPoint_get,.p_beginPoint_get): return true
            case (.p_dragAxis_get,.p_dragAxis_get): return true
            case (.p_beginDragValue_get,.p_beginDragValue_get): return true
            case (.p_dragDelta_get,.p_dragDelta_get): return true
            case (.p_state_get,.p_state_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_dragNode_get: return 0
            case .p_beginPoint_get: return 0
            case .p_dragAxis_get: return 0
            case .p_beginDragValue_get: return 0
            case .p_dragDelta_get: return 0
            case .p_state_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func dragNode(getter defaultValue: Dragging?...) -> PropertyStub {
            return Given(method: .p_dragNode_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func beginPoint(getter defaultValue: SCNVector3...) -> PropertyStub {
            return Given(method: .p_beginPoint_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func dragAxis(getter defaultValue: Ray?...) -> PropertyStub {
            return Given(method: .p_dragAxis_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func beginDragValue(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_beginDragValue_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func dragDelta(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_dragDelta_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func state(getter defaultValue: UIGestureRecognizer.State...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var dragNode: Verify { return Verify(method: .p_dragNode_get) }
        public static var beginPoint: Verify { return Verify(method: .p_beginPoint_get) }
        public static var dragAxis: Verify { return Verify(method: .p_dragAxis_get) }
        public static var beginDragValue: Verify { return Verify(method: .p_beginDragValue_get) }
        public static var dragDelta: Verify { return Verify(method: .p_dragDelta_get) }
        public static var state: Verify { return Verify(method: .p_state_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - DropdownListItemTapHandling
open class DropdownListItemTapHandlingMock: DropdownListItemTapHandling, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func handleTap(_ sender: UiDropdownListItemNode) {
        addInvocation(.m_handleTap__sender(Parameter<UiDropdownListItemNode>.value(`sender`)))
		let perform = methodPerformValue(.m_handleTap__sender(Parameter<UiDropdownListItemNode>.value(`sender`))) as? (UiDropdownListItemNode) -> Void
		perform?(`sender`)
    }


    fileprivate enum MethodType {
        case m_handleTap__sender(Parameter<UiDropdownListItemNode>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_handleTap__sender(let lhsSender), .m_handleTap__sender(let rhsSender)):
                guard Parameter.compare(lhs: lhsSender, rhs: rhsSender, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_handleTap__sender(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func handleTap(_ sender: Parameter<UiDropdownListItemNode>) -> Verify { return Verify(method: .m_handleTap__sender(`sender`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func handleTap(_ sender: Parameter<UiDropdownListItemNode>, perform: @escaping (UiDropdownListItemNode) -> Void) -> Perform {
            return Perform(method: .m_handleTap__sender(`sender`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - FileManaging
open class FileManagingMock: FileManaging, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL] {
        addInvocation(.m_urls__for_directoryin_domainMask(Parameter<FileManager.SearchPathDirectory>.value(`directory`), Parameter<FileManager.SearchPathDomainMask>.value(`domainMask`)))
		let perform = methodPerformValue(.m_urls__for_directoryin_domainMask(Parameter<FileManager.SearchPathDirectory>.value(`directory`), Parameter<FileManager.SearchPathDomainMask>.value(`domainMask`))) as? (FileManager.SearchPathDirectory, FileManager.SearchPathDomainMask) -> Void
		perform?(`directory`, `domainMask`)
		var __value: [URL]
		do {
		    __value = try methodReturnValue(.m_urls__for_directoryin_domainMask(Parameter<FileManager.SearchPathDirectory>.value(`directory`), Parameter<FileManager.SearchPathDomainMask>.value(`domainMask`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask). Use given")
			Failure("Stub return value not specified for urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask). Use given")
		}
		return __value
    }

    open func removeItem(at URL: URL) throws {
        addInvocation(.m_removeItem__at_URL(Parameter<URL>.value(`URL`)))
		let perform = methodPerformValue(.m_removeItem__at_URL(Parameter<URL>.value(`URL`))) as? (URL) -> Void
		perform?(`URL`)
		do {
		    _ = try methodReturnValue(.m_removeItem__at_URL(Parameter<URL>.value(`URL`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func copyItem(at srcURL: URL, to dstURL: URL) throws {
        addInvocation(.m_copyItem__at_srcURLto_dstURL(Parameter<URL>.value(`srcURL`), Parameter<URL>.value(`dstURL`)))
		let perform = methodPerformValue(.m_copyItem__at_srcURLto_dstURL(Parameter<URL>.value(`srcURL`), Parameter<URL>.value(`dstURL`))) as? (URL, URL) -> Void
		perform?(`srcURL`, `dstURL`)
		do {
		    _ = try methodReturnValue(.m_copyItem__at_srcURLto_dstURL(Parameter<URL>.value(`srcURL`), Parameter<URL>.value(`dstURL`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }


    fileprivate enum MethodType {
        case m_urls__for_directoryin_domainMask(Parameter<FileManager.SearchPathDirectory>, Parameter<FileManager.SearchPathDomainMask>)
        case m_removeItem__at_URL(Parameter<URL>)
        case m_copyItem__at_srcURLto_dstURL(Parameter<URL>, Parameter<URL>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_urls__for_directoryin_domainMask(let lhsDirectory, let lhsDomainmask), .m_urls__for_directoryin_domainMask(let rhsDirectory, let rhsDomainmask)):
                guard Parameter.compare(lhs: lhsDirectory, rhs: rhsDirectory, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsDomainmask, rhs: rhsDomainmask, with: matcher) else { return false } 
                return true 
            case (.m_removeItem__at_URL(let lhsUrl), .m_removeItem__at_URL(let rhsUrl)):
                guard Parameter.compare(lhs: lhsUrl, rhs: rhsUrl, with: matcher) else { return false } 
                return true 
            case (.m_copyItem__at_srcURLto_dstURL(let lhsSrcurl, let lhsDsturl), .m_copyItem__at_srcURLto_dstURL(let rhsSrcurl, let rhsDsturl)):
                guard Parameter.compare(lhs: lhsSrcurl, rhs: rhsSrcurl, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsDsturl, rhs: rhsDsturl, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_urls__for_directoryin_domainMask(p0, p1): return p0.intValue + p1.intValue
            case let .m_removeItem__at_URL(p0): return p0.intValue
            case let .m_copyItem__at_srcURLto_dstURL(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func urls(for directory: Parameter<FileManager.SearchPathDirectory>, in domainMask: Parameter<FileManager.SearchPathDomainMask>, willReturn: [URL]...) -> MethodStub {
            return Given(method: .m_urls__for_directoryin_domainMask(`directory`, `domainMask`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func urls(for directory: Parameter<FileManager.SearchPathDirectory>, in domainMask: Parameter<FileManager.SearchPathDomainMask>, willProduce: (Stubber<[URL]>) -> Void) -> MethodStub {
            let willReturn: [[URL]] = []
			let given: Given = { return Given(method: .m_urls__for_directoryin_domainMask(`directory`, `domainMask`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([URL]).self)
			willProduce(stubber)
			return given
        }
        public static func removeItem(at URL: Parameter<URL>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_removeItem__at_URL(`URL`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func removeItem(at URL: Parameter<URL>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_removeItem__at_URL(`URL`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func copyItem(at srcURL: Parameter<URL>, to dstURL: Parameter<URL>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_copyItem__at_srcURLto_dstURL(`srcURL`, `dstURL`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func copyItem(at srcURL: Parameter<URL>, to dstURL: Parameter<URL>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_copyItem__at_srcURLto_dstURL(`srcURL`, `dstURL`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func urls(for directory: Parameter<FileManager.SearchPathDirectory>, in domainMask: Parameter<FileManager.SearchPathDomainMask>) -> Verify { return Verify(method: .m_urls__for_directoryin_domainMask(`directory`, `domainMask`))}
        public static func removeItem(at URL: Parameter<URL>) -> Verify { return Verify(method: .m_removeItem__at_URL(`URL`))}
        public static func copyItem(at srcURL: Parameter<URL>, to dstURL: Parameter<URL>) -> Verify { return Verify(method: .m_copyItem__at_srcURLto_dstURL(`srcURL`, `dstURL`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func urls(for directory: Parameter<FileManager.SearchPathDirectory>, in domainMask: Parameter<FileManager.SearchPathDomainMask>, perform: @escaping (FileManager.SearchPathDirectory, FileManager.SearchPathDomainMask) -> Void) -> Perform {
            return Perform(method: .m_urls__for_directoryin_domainMask(`directory`, `domainMask`), performs: perform)
        }
        public static func removeItem(at URL: Parameter<URL>, perform: @escaping (URL) -> Void) -> Perform {
            return Perform(method: .m_removeItem__at_URL(`URL`), performs: perform)
        }
        public static func copyItem(at srcURL: Parameter<URL>, to dstURL: Parameter<URL>, perform: @escaping (URL, URL) -> Void) -> Perform {
            return Perform(method: .m_copyItem__at_srcURLto_dstURL(`srcURL`, `dstURL`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - GLTFSceneSourceBuilding
open class GLTFSceneSourceBuildingMock: GLTFSceneSourceBuilding, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func build(path: String, options: [SCNSceneSource.LoadingOption : Any]?, extensions: [String:Codable.Type]?) throws -> GLTFSceneSourceProtocol {
        addInvocation(.m_build__path_pathoptions_optionsextensions_extensions(Parameter<String>.value(`path`), Parameter<[SCNSceneSource.LoadingOption : Any]?>.value(`options`), Parameter<[String:Codable.Type]?>.value(`extensions`)))
		let perform = methodPerformValue(.m_build__path_pathoptions_optionsextensions_extensions(Parameter<String>.value(`path`), Parameter<[SCNSceneSource.LoadingOption : Any]?>.value(`options`), Parameter<[String:Codable.Type]?>.value(`extensions`))) as? (String, [SCNSceneSource.LoadingOption : Any]?, [String:Codable.Type]?) -> Void
		perform?(`path`, `options`, `extensions`)
		var __value: GLTFSceneSourceProtocol
		do {
		    __value = try methodReturnValue(.m_build__path_pathoptions_optionsextensions_extensions(Parameter<String>.value(`path`), Parameter<[SCNSceneSource.LoadingOption : Any]?>.value(`options`), Parameter<[String:Codable.Type]?>.value(`extensions`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for build(path: String, options: [SCNSceneSource.LoadingOption : Any]?, extensions: [String:Codable.Type]?). Use given")
			Failure("Stub return value not specified for build(path: String, options: [SCNSceneSource.LoadingOption : Any]?, extensions: [String:Codable.Type]?). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_build__path_pathoptions_optionsextensions_extensions(Parameter<String>, Parameter<[SCNSceneSource.LoadingOption : Any]?>, Parameter<[String:Codable.Type]?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_build__path_pathoptions_optionsextensions_extensions(let lhsPath, let lhsOptions, let lhsExtensions), .m_build__path_pathoptions_optionsextensions_extensions(let rhsPath, let rhsOptions, let rhsExtensions)):
                guard Parameter.compare(lhs: lhsPath, rhs: rhsPath, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOptions, rhs: rhsOptions, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsExtensions, rhs: rhsExtensions, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_build__path_pathoptions_optionsextensions_extensions(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func build(path: Parameter<String>, options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, extensions: Parameter<[String:Codable.Type]?>, willReturn: GLTFSceneSourceProtocol...) -> MethodStub {
            return Given(method: .m_build__path_pathoptions_optionsextensions_extensions(`path`, `options`, `extensions`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func build(path: Parameter<String>, options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, extensions: Parameter<[String:Codable.Type]?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_build__path_pathoptions_optionsextensions_extensions(`path`, `options`, `extensions`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func build(path: Parameter<String>, options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, extensions: Parameter<[String:Codable.Type]?>, willProduce: (StubberThrows<GLTFSceneSourceProtocol>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_build__path_pathoptions_optionsextensions_extensions(`path`, `options`, `extensions`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (GLTFSceneSourceProtocol).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func build(path: Parameter<String>, options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, extensions: Parameter<[String:Codable.Type]?>) -> Verify { return Verify(method: .m_build__path_pathoptions_optionsextensions_extensions(`path`, `options`, `extensions`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func build(path: Parameter<String>, options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, extensions: Parameter<[String:Codable.Type]?>, perform: @escaping (String, [SCNSceneSource.LoadingOption : Any]?, [String:Codable.Type]?) -> Void) -> Perform {
            return Perform(method: .m_build__path_pathoptions_optionsextensions_extensions(`path`, `options`, `extensions`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - GLTFSceneSourceProtocol
open class GLTFSceneSourceProtocolMock: GLTFSceneSourceProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func scene(options: [SCNSceneSource.LoadingOption : Any]?) throws -> SCNScene {
        addInvocation(.m_scene__options_options(Parameter<[SCNSceneSource.LoadingOption : Any]?>.value(`options`)))
		let perform = methodPerformValue(.m_scene__options_options(Parameter<[SCNSceneSource.LoadingOption : Any]?>.value(`options`))) as? ([SCNSceneSource.LoadingOption : Any]?) -> Void
		perform?(`options`)
		var __value: SCNScene
		do {
		    __value = try methodReturnValue(.m_scene__options_options(Parameter<[SCNSceneSource.LoadingOption : Any]?>.value(`options`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for scene(options: [SCNSceneSource.LoadingOption : Any]?). Use given")
			Failure("Stub return value not specified for scene(options: [SCNSceneSource.LoadingOption : Any]?). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_scene__options_options(Parameter<[SCNSceneSource.LoadingOption : Any]?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_scene__options_options(let lhsOptions), .m_scene__options_options(let rhsOptions)):
                guard Parameter.compare(lhs: lhsOptions, rhs: rhsOptions, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_scene__options_options(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func scene(options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, willReturn: SCNScene...) -> MethodStub {
            return Given(method: .m_scene__options_options(`options`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func scene(options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_scene__options_options(`options`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func scene(options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, willProduce: (StubberThrows<SCNScene>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_scene__options_options(`options`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (SCNScene).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func scene(options: Parameter<[SCNSceneSource.LoadingOption : Any]?>) -> Verify { return Verify(method: .m_scene__options_options(`options`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func scene(options: Parameter<[SCNSceneSource.LoadingOption : Any]?>, perform: @escaping ([SCNSceneSource.LoadingOption : Any]?) -> Void) -> Perform {
            return Perform(method: .m_scene__options_options(`options`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - GestureHandling
open class GestureHandlingMock: NSObject, GestureHandling, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func handleTapGesture(_ sender: TapGestureRecognizing) {
        addInvocation(.m_handleTapGesture__sender(Parameter<TapGestureRecognizing>.value(`sender`)))
		let perform = methodPerformValue(.m_handleTapGesture__sender(Parameter<TapGestureRecognizing>.value(`sender`))) as? (TapGestureRecognizing) -> Void
		perform?(`sender`)
    }

    open func handleDragGesture(_ sender: DragGestureRecognizing) {
        addInvocation(.m_handleDragGesture__sender(Parameter<DragGestureRecognizing>.value(`sender`)))
		let perform = methodPerformValue(.m_handleDragGesture__sender(Parameter<DragGestureRecognizing>.value(`sender`))) as? (DragGestureRecognizing) -> Void
		perform?(`sender`)
    }

    open func handleLongPressGesture(_ sender: LongPressGestureRecognizing) {
        addInvocation(.m_handleLongPressGesture__sender(Parameter<LongPressGestureRecognizing>.value(`sender`)))
		let perform = methodPerformValue(.m_handleLongPressGesture__sender(Parameter<LongPressGestureRecognizing>.value(`sender`))) as? (LongPressGestureRecognizing) -> Void
		perform?(`sender`)
    }


    fileprivate enum MethodType {
        case m_handleTapGesture__sender(Parameter<TapGestureRecognizing>)
        case m_handleDragGesture__sender(Parameter<DragGestureRecognizing>)
        case m_handleLongPressGesture__sender(Parameter<LongPressGestureRecognizing>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_handleTapGesture__sender(let lhsSender), .m_handleTapGesture__sender(let rhsSender)):
                guard Parameter.compare(lhs: lhsSender, rhs: rhsSender, with: matcher) else { return false } 
                return true 
            case (.m_handleDragGesture__sender(let lhsSender), .m_handleDragGesture__sender(let rhsSender)):
                guard Parameter.compare(lhs: lhsSender, rhs: rhsSender, with: matcher) else { return false } 
                return true 
            case (.m_handleLongPressGesture__sender(let lhsSender), .m_handleLongPressGesture__sender(let rhsSender)):
                guard Parameter.compare(lhs: lhsSender, rhs: rhsSender, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_handleTapGesture__sender(p0): return p0.intValue
            case let .m_handleDragGesture__sender(p0): return p0.intValue
            case let .m_handleLongPressGesture__sender(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func handleTapGesture(_ sender: Parameter<TapGestureRecognizing>) -> Verify { return Verify(method: .m_handleTapGesture__sender(`sender`))}
        public static func handleDragGesture(_ sender: Parameter<DragGestureRecognizing>) -> Verify { return Verify(method: .m_handleDragGesture__sender(`sender`))}
        public static func handleLongPressGesture(_ sender: Parameter<LongPressGestureRecognizing>) -> Verify { return Verify(method: .m_handleLongPressGesture__sender(`sender`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func handleTapGesture(_ sender: Parameter<TapGestureRecognizing>, perform: @escaping (TapGestureRecognizing) -> Void) -> Perform {
            return Perform(method: .m_handleTapGesture__sender(`sender`), performs: perform)
        }
        public static func handleDragGesture(_ sender: Parameter<DragGestureRecognizing>, perform: @escaping (DragGestureRecognizing) -> Void) -> Perform {
            return Perform(method: .m_handleDragGesture__sender(`sender`), performs: perform)
        }
        public static func handleLongPressGesture(_ sender: Parameter<LongPressGestureRecognizing>, perform: @escaping (LongPressGestureRecognizing) -> Void) -> Perform {
            return Perform(method: .m_handleLongPressGesture__sender(`sender`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - GestureManaging
open class GestureManagingMock: GestureManaging, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var allowsCameraGestures: Bool {
		get {	invocations.append(.p_allowsCameraGestures_get); return __p_allowsCameraGestures ?? givenGetterValue(.p_allowsCameraGestures_get, "GestureManagingMock - stub value for allowsCameraGestures was not defined") }
		set {	invocations.append(.p_allowsCameraGestures_set(.value(newValue))); __p_allowsCameraGestures = newValue }
	}
	private var __p_allowsCameraGestures: (Bool)?

    public var recognizers: [Interaction: GestureRecognizing]? {
		get {	invocations.append(.p_recognizers_get); return __p_recognizers ?? optionalGivenGetterValue(.p_recognizers_get, "GestureManagingMock - stub value for recognizers was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_recognizers = newValue }
	}
	private var __p_recognizers: ([Interaction: GestureRecognizing])?





    open func addGestureRecognizer(_ gestureRecognizer: GestureRecognizing) {
        addInvocation(.m_addGestureRecognizer__gestureRecognizer(Parameter<GestureRecognizing>.value(`gestureRecognizer`)))
		let perform = methodPerformValue(.m_addGestureRecognizer__gestureRecognizer(Parameter<GestureRecognizing>.value(`gestureRecognizer`))) as? (GestureRecognizing) -> Void
		perform?(`gestureRecognizer`)
    }

    open func removeGestureRecognizer(_ gestureRecognizer: GestureRecognizing) {
        addInvocation(.m_removeGestureRecognizer__gestureRecognizer(Parameter<GestureRecognizing>.value(`gestureRecognizer`)))
		let perform = methodPerformValue(.m_removeGestureRecognizer__gestureRecognizer(Parameter<GestureRecognizing>.value(`gestureRecognizer`))) as? (GestureRecognizing) -> Void
		perform?(`gestureRecognizer`)
    }


    fileprivate enum MethodType {
        case m_addGestureRecognizer__gestureRecognizer(Parameter<GestureRecognizing>)
        case m_removeGestureRecognizer__gestureRecognizer(Parameter<GestureRecognizing>)
        case p_allowsCameraGestures_get
		case p_allowsCameraGestures_set(Parameter<Bool>)
        case p_recognizers_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_addGestureRecognizer__gestureRecognizer(let lhsGesturerecognizer), .m_addGestureRecognizer__gestureRecognizer(let rhsGesturerecognizer)):
                guard Parameter.compare(lhs: lhsGesturerecognizer, rhs: rhsGesturerecognizer, with: matcher) else { return false } 
                return true 
            case (.m_removeGestureRecognizer__gestureRecognizer(let lhsGesturerecognizer), .m_removeGestureRecognizer__gestureRecognizer(let rhsGesturerecognizer)):
                guard Parameter.compare(lhs: lhsGesturerecognizer, rhs: rhsGesturerecognizer, with: matcher) else { return false } 
                return true 
            case (.p_allowsCameraGestures_get,.p_allowsCameraGestures_get): return true
			case (.p_allowsCameraGestures_set(let left),.p_allowsCameraGestures_set(let right)): return Parameter<Bool>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_recognizers_get,.p_recognizers_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_addGestureRecognizer__gestureRecognizer(p0): return p0.intValue
            case let .m_removeGestureRecognizer__gestureRecognizer(p0): return p0.intValue
            case .p_allowsCameraGestures_get: return 0
			case .p_allowsCameraGestures_set(let newValue): return newValue.intValue
            case .p_recognizers_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func allowsCameraGestures(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_allowsCameraGestures_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func recognizers(getter defaultValue: [Interaction: GestureRecognizing]?...) -> PropertyStub {
            return Given(method: .p_recognizers_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func addGestureRecognizer(_ gestureRecognizer: Parameter<GestureRecognizing>) -> Verify { return Verify(method: .m_addGestureRecognizer__gestureRecognizer(`gestureRecognizer`))}
        public static func removeGestureRecognizer(_ gestureRecognizer: Parameter<GestureRecognizing>) -> Verify { return Verify(method: .m_removeGestureRecognizer__gestureRecognizer(`gestureRecognizer`))}
        public static var allowsCameraGestures: Verify { return Verify(method: .p_allowsCameraGestures_get) }
		public static func allowsCameraGestures(set newValue: Parameter<Bool>) -> Verify { return Verify(method: .p_allowsCameraGestures_set(newValue)) }
        public static var recognizers: Verify { return Verify(method: .p_recognizers_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func addGestureRecognizer(_ gestureRecognizer: Parameter<GestureRecognizing>, perform: @escaping (GestureRecognizing) -> Void) -> Perform {
            return Perform(method: .m_addGestureRecognizer__gestureRecognizer(`gestureRecognizer`), performs: perform)
        }
        public static func removeGestureRecognizer(_ gestureRecognizer: Parameter<GestureRecognizing>, perform: @escaping (GestureRecognizing) -> Void) -> Perform {
            return Perform(method: .m_removeGestureRecognizer__gestureRecognizer(`gestureRecognizer`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - GestureRecognizing
open class GestureRecognizingMock: NSObject, GestureRecognizing, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var view: UIView? {
		get {	invocations.append(.p_view_get); return __p_view ?? optionalGivenGetterValue(.p_view_get, "GestureRecognizingMock - stub value for view was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_view = newValue }
	}
	private var __p_view: (UIView)?

    public var state: UIGestureRecognizer.State {
		get {	invocations.append(.p_state_get); return __p_state ?? givenGetterValue(.p_state_get, "GestureRecognizingMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (UIGestureRecognizer.State)?






    fileprivate enum MethodType {
        case p_view_get
        case p_state_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_view_get,.p_view_get): return true
            case (.p_state_get,.p_state_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_view_get: return 0
            case .p_state_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func view(getter defaultValue: UIView?...) -> PropertyStub {
            return Given(method: .p_view_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func state(getter defaultValue: UIGestureRecognizer.State...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var view: Verify { return Verify(method: .p_view_get) }
        public static var state: Verify { return Verify(method: .p_state_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - InputDataProviding
open class InputDataProvidingMock: InputDataProviding, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var value: Any? {
		get {	invocations.append(.p_value_get); return __p_value ?? optionalGivenGetterValue(.p_value_get, "InputDataProvidingMock - stub value for value was not defined") }
		set {	invocations.append(.p_value_set(.value(newValue))); __p_value = newValue }
	}
	private var __p_value: (Any)?

    public var placeholder: String? {
		get {	invocations.append(.p_placeholder_get); return __p_placeholder ?? optionalGivenGetterValue(.p_placeholder_get, "InputDataProvidingMock - stub value for placeholder was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_placeholder = newValue }
	}
	private var __p_placeholder: (String)?

    public var charLimit: Int {
		get {	invocations.append(.p_charLimit_get); return __p_charLimit ?? givenGetterValue(.p_charLimit_get, "InputDataProvidingMock - stub value for charLimit was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_charLimit = newValue }
	}
	private var __p_charLimit: (Int)?

    public var multiline: Bool {
		get {	invocations.append(.p_multiline_get); return __p_multiline ?? givenGetterValue(.p_multiline_get, "InputDataProvidingMock - stub value for multiline was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_multiline = newValue }
	}
	private var __p_multiline: (Bool)?

    public var password: Bool {
		get {	invocations.append(.p_password_get); return __p_password ?? givenGetterValue(.p_password_get, "InputDataProvidingMock - stub value for password was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_password = newValue }
	}
	private var __p_password: (Bool)?

    public var autocapitalizationType: UITextAutocapitalizationType? {
		get {	invocations.append(.p_autocapitalizationType_get); return __p_autocapitalizationType ?? optionalGivenGetterValue(.p_autocapitalizationType_get, "InputDataProvidingMock - stub value for autocapitalizationType was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_autocapitalizationType = newValue }
	}
	private var __p_autocapitalizationType: (UITextAutocapitalizationType)?

    public var keyboardType: UIKeyboardType? {
		get {	invocations.append(.p_keyboardType_get); return __p_keyboardType ?? optionalGivenGetterValue(.p_keyboardType_get, "InputDataProvidingMock - stub value for keyboardType was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_keyboardType = newValue }
	}
	private var __p_keyboardType: (UIKeyboardType)?

    public var textContentType: UITextContentType? {
		get {	invocations.append(.p_textContentType_get); return __p_textContentType ?? optionalGivenGetterValue(.p_textContentType_get, "InputDataProvidingMock - stub value for textContentType was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_textContentType = newValue }
	}
	private var __p_textContentType: (UITextContentType)?






    fileprivate enum MethodType {
        case p_value_get
		case p_value_set(Parameter<Any?>)
        case p_placeholder_get
        case p_charLimit_get
        case p_multiline_get
        case p_password_get
        case p_autocapitalizationType_get
        case p_keyboardType_get
        case p_textContentType_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_value_get,.p_value_get): return true
			case (.p_value_set(let left),.p_value_set(let right)): return Parameter<Any?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_placeholder_get,.p_placeholder_get): return true
            case (.p_charLimit_get,.p_charLimit_get): return true
            case (.p_multiline_get,.p_multiline_get): return true
            case (.p_password_get,.p_password_get): return true
            case (.p_autocapitalizationType_get,.p_autocapitalizationType_get): return true
            case (.p_keyboardType_get,.p_keyboardType_get): return true
            case (.p_textContentType_get,.p_textContentType_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_value_get: return 0
			case .p_value_set(let newValue): return newValue.intValue
            case .p_placeholder_get: return 0
            case .p_charLimit_get: return 0
            case .p_multiline_get: return 0
            case .p_password_get: return 0
            case .p_autocapitalizationType_get: return 0
            case .p_keyboardType_get: return 0
            case .p_textContentType_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func value(getter defaultValue: Any?...) -> PropertyStub {
            return Given(method: .p_value_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func placeholder(getter defaultValue: String?...) -> PropertyStub {
            return Given(method: .p_placeholder_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func charLimit(getter defaultValue: Int...) -> PropertyStub {
            return Given(method: .p_charLimit_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func multiline(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_multiline_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func password(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_password_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func autocapitalizationType(getter defaultValue: UITextAutocapitalizationType?...) -> PropertyStub {
            return Given(method: .p_autocapitalizationType_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func keyboardType(getter defaultValue: UIKeyboardType?...) -> PropertyStub {
            return Given(method: .p_keyboardType_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func textContentType(getter defaultValue: UITextContentType?...) -> PropertyStub {
            return Given(method: .p_textContentType_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var value: Verify { return Verify(method: .p_value_get) }
		public static func value(set newValue: Parameter<Any?>) -> Verify { return Verify(method: .p_value_set(newValue)) }
        public static var placeholder: Verify { return Verify(method: .p_placeholder_get) }
        public static var charLimit: Verify { return Verify(method: .p_charLimit_get) }
        public static var multiline: Verify { return Verify(method: .p_multiline_get) }
        public static var password: Verify { return Verify(method: .p_password_get) }
        public static var autocapitalizationType: Verify { return Verify(method: .p_autocapitalizationType_get) }
        public static var keyboardType: Verify { return Verify(method: .p_keyboardType_get) }
        public static var textContentType: Verify { return Verify(method: .p_textContentType_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - LongPressGestureRecognizing
open class LongPressGestureRecognizingMock: NSObject, LongPressGestureRecognizing, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var longPressedNode: BaseNode? {
		get {	invocations.append(.p_longPressedNode_get); return __p_longPressedNode ?? optionalGivenGetterValue(.p_longPressedNode_get, "LongPressGestureRecognizingMock - stub value for longPressedNode was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_longPressedNode = newValue }
	}
	private var __p_longPressedNode: (BaseNode)?

    public var state: UIGestureRecognizer.State {
		get {	invocations.append(.p_state_get); return __p_state ?? givenGetterValue(.p_state_get, "LongPressGestureRecognizingMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (UIGestureRecognizer.State)?






    fileprivate enum MethodType {
        case p_longPressedNode_get
        case p_state_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_longPressedNode_get,.p_longPressedNode_get): return true
            case (.p_state_get,.p_state_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_longPressedNode_get: return 0
            case .p_state_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func longPressedNode(getter defaultValue: BaseNode?...) -> PropertyStub {
            return Given(method: .p_longPressedNode_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func state(getter defaultValue: UIGestureRecognizer.State...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var longPressedNode: Verify { return Verify(method: .p_longPressedNode_get) }
        public static var state: Verify { return Verify(method: .p_state_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NodeAnimating
open class NodeAnimatingMock: NodeAnimating, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func startAnimation(duration: TimeInterval, update: @escaping (_ node: SCNNode, _ timeElapsed: CGFloat) -> Void) {
        addInvocation(.m_startAnimation__duration_durationupdate_update(Parameter<TimeInterval>.value(`duration`), Parameter<(_ node: SCNNode, _ timeElapsed: CGFloat) -> Void>.value(`update`)))
		let perform = methodPerformValue(.m_startAnimation__duration_durationupdate_update(Parameter<TimeInterval>.value(`duration`), Parameter<(_ node: SCNNode, _ timeElapsed: CGFloat) -> Void>.value(`update`))) as? (TimeInterval, @escaping (_ node: SCNNode, _ timeElapsed: CGFloat) -> Void) -> Void
		perform?(`duration`, `update`)
    }

    open func stopAnimation() {
        addInvocation(.m_stopAnimation)
		let perform = methodPerformValue(.m_stopAnimation) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_startAnimation__duration_durationupdate_update(Parameter<TimeInterval>, Parameter<(_ node: SCNNode, _ timeElapsed: CGFloat) -> Void>)
        case m_stopAnimation

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_startAnimation__duration_durationupdate_update(let lhsDuration, let lhsUpdate), .m_startAnimation__duration_durationupdate_update(let rhsDuration, let rhsUpdate)):
                guard Parameter.compare(lhs: lhsDuration, rhs: rhsDuration, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsUpdate, rhs: rhsUpdate, with: matcher) else { return false } 
                return true 
            case (.m_stopAnimation, .m_stopAnimation):
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_startAnimation__duration_durationupdate_update(p0, p1): return p0.intValue + p1.intValue
            case .m_stopAnimation: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func startAnimation(duration: Parameter<TimeInterval>, update: Parameter<(_ node: SCNNode, _ timeElapsed: CGFloat) -> Void>) -> Verify { return Verify(method: .m_startAnimation__duration_durationupdate_update(`duration`, `update`))}
        public static func stopAnimation() -> Verify { return Verify(method: .m_stopAnimation)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func startAnimation(duration: Parameter<TimeInterval>, update: Parameter<(_ node: SCNNode, _ timeElapsed: CGFloat) -> Void>, perform: @escaping (TimeInterval, @escaping (_ node: SCNNode, _ timeElapsed: CGFloat) -> Void) -> Void) -> Perform {
            return Perform(method: .m_startAnimation__duration_durationupdate_update(`duration`, `update`), performs: perform)
        }
        public static func stopAnimation(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_stopAnimation, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NodeSelecting
open class NodeSelectingMock: NodeSelecting, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func hitTest(ray: Ray) -> HitTestResult? {
        addInvocation(.m_hitTest__ray_ray(Parameter<Ray>.value(`ray`)))
		let perform = methodPerformValue(.m_hitTest__ray_ray(Parameter<Ray>.value(`ray`))) as? (Ray) -> Void
		perform?(`ray`)
		var __value: HitTestResult? = nil
		do {
		    __value = try methodReturnValue(.m_hitTest__ray_ray(Parameter<Ray>.value(`ray`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func draggingHitTest(ray: Ray) -> Dragging? {
        addInvocation(.m_draggingHitTest__ray_ray(Parameter<Ray>.value(`ray`)))
		let perform = methodPerformValue(.m_draggingHitTest__ray_ray(Parameter<Ray>.value(`ray`))) as? (Ray) -> Void
		perform?(`ray`)
		var __value: Dragging? = nil
		do {
		    __value = try methodReturnValue(.m_draggingHitTest__ray_ray(Parameter<Ray>.value(`ray`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_hitTest__ray_ray(Parameter<Ray>)
        case m_draggingHitTest__ray_ray(Parameter<Ray>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_hitTest__ray_ray(let lhsRay), .m_hitTest__ray_ray(let rhsRay)):
                guard Parameter.compare(lhs: lhsRay, rhs: rhsRay, with: matcher) else { return false } 
                return true 
            case (.m_draggingHitTest__ray_ray(let lhsRay), .m_draggingHitTest__ray_ray(let rhsRay)):
                guard Parameter.compare(lhs: lhsRay, rhs: rhsRay, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_hitTest__ray_ray(p0): return p0.intValue
            case let .m_draggingHitTest__ray_ray(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func hitTest(ray: Parameter<Ray>, willReturn: HitTestResult?...) -> MethodStub {
            return Given(method: .m_hitTest__ray_ray(`ray`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func draggingHitTest(ray: Parameter<Ray>, willReturn: Dragging?...) -> MethodStub {
            return Given(method: .m_draggingHitTest__ray_ray(`ray`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func hitTest(ray: Parameter<Ray>, willProduce: (Stubber<HitTestResult?>) -> Void) -> MethodStub {
            let willReturn: [HitTestResult?] = []
			let given: Given = { return Given(method: .m_hitTest__ray_ray(`ray`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (HitTestResult?).self)
			willProduce(stubber)
			return given
        }
        public static func draggingHitTest(ray: Parameter<Ray>, willProduce: (Stubber<Dragging?>) -> Void) -> MethodStub {
            let willReturn: [Dragging?] = []
			let given: Given = { return Given(method: .m_draggingHitTest__ray_ray(`ray`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Dragging?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func hitTest(ray: Parameter<Ray>) -> Verify { return Verify(method: .m_hitTest__ray_ray(`ray`))}
        public static func draggingHitTest(ray: Parameter<Ray>) -> Verify { return Verify(method: .m_draggingHitTest__ray_ray(`ray`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func hitTest(ray: Parameter<Ray>, perform: @escaping (Ray) -> Void) -> Perform {
            return Perform(method: .m_hitTest__ray_ray(`ray`), performs: perform)
        }
        public static func draggingHitTest(ray: Parameter<Ray>, perform: @escaping (Ray) -> Void) -> Perform {
            return Perform(method: .m_draggingHitTest__ray_ray(`ray`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NodesGestureHandling
open class NodesGestureHandlingMock: NodesGestureHandling, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var onInputFocused: ((_ input: DataProviding) -> (Void))? {
		get {	invocations.append(.p_onInputFocused_get); return __p_onInputFocused ?? optionalGivenGetterValue(.p_onInputFocused_get, "NodesGestureHandlingMock - stub value for onInputFocused was not defined") }
		set {	invocations.append(.p_onInputFocused_set(.value(newValue))); __p_onInputFocused = newValue }
	}
	private var __p_onInputFocused: ((_ input: DataProviding) -> (Void))?

    public var onInputUnfocused: (() -> (Void))? {
		get {	invocations.append(.p_onInputUnfocused_get); return __p_onInputUnfocused ?? optionalGivenGetterValue(.p_onInputUnfocused_get, "NodesGestureHandlingMock - stub value for onInputUnfocused was not defined") }
		set {	invocations.append(.p_onInputUnfocused_set(.value(newValue))); __p_onInputUnfocused = newValue }
	}
	private var __p_onInputUnfocused: (() -> (Void))?





    open func handleNodeTap(_ node: BaseNode?) {
        addInvocation(.m_handleNodeTap__node(Parameter<BaseNode?>.value(`node`)))
		let perform = methodPerformValue(.m_handleNodeTap__node(Parameter<BaseNode?>.value(`node`))) as? (BaseNode?) -> Void
		perform?(`node`)
    }

    open func handleNodeLongPress(_ node: BaseNode?, _ state: UIGestureRecognizer.State) {
        addInvocation(.m_handleNodeLongPress__node_state(Parameter<BaseNode?>.value(`node`), Parameter<UIGestureRecognizer.State>.value(`state`)))
		let perform = methodPerformValue(.m_handleNodeLongPress__node_state(Parameter<BaseNode?>.value(`node`), Parameter<UIGestureRecognizer.State>.value(`state`))) as? (BaseNode?, UIGestureRecognizer.State) -> Void
		perform?(`node`, `state`)
    }


    fileprivate enum MethodType {
        case m_handleNodeTap__node(Parameter<BaseNode?>)
        case m_handleNodeLongPress__node_state(Parameter<BaseNode?>, Parameter<UIGestureRecognizer.State>)
        case p_onInputFocused_get
		case p_onInputFocused_set(Parameter<((_ input: DataProviding) -> (Void))?>)
        case p_onInputUnfocused_get
		case p_onInputUnfocused_set(Parameter<(() -> (Void))?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_handleNodeTap__node(let lhsNode), .m_handleNodeTap__node(let rhsNode)):
                guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                return true 
            case (.m_handleNodeLongPress__node_state(let lhsNode, let lhsState), .m_handleNodeLongPress__node_state(let rhsNode, let rhsState)):
                guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsState, rhs: rhsState, with: matcher) else { return false } 
                return true 
            case (.p_onInputFocused_get,.p_onInputFocused_get): return true
			case (.p_onInputFocused_set(let left),.p_onInputFocused_set(let right)): return Parameter<((_ input: DataProviding) -> (Void))?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_onInputUnfocused_get,.p_onInputUnfocused_get): return true
			case (.p_onInputUnfocused_set(let left),.p_onInputUnfocused_set(let right)): return Parameter<(() -> (Void))?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_handleNodeTap__node(p0): return p0.intValue
            case let .m_handleNodeLongPress__node_state(p0, p1): return p0.intValue + p1.intValue
            case .p_onInputFocused_get: return 0
			case .p_onInputFocused_set(let newValue): return newValue.intValue
            case .p_onInputUnfocused_get: return 0
			case .p_onInputUnfocused_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func onInputFocused(getter defaultValue: ((_ input: DataProviding) -> (Void))?...) -> PropertyStub {
            return Given(method: .p_onInputFocused_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func onInputUnfocused(getter defaultValue: (() -> (Void))?...) -> PropertyStub {
            return Given(method: .p_onInputUnfocused_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func handleNodeTap(_ node: Parameter<BaseNode?>) -> Verify { return Verify(method: .m_handleNodeTap__node(`node`))}
        public static func handleNodeLongPress(_ node: Parameter<BaseNode?>, _ state: Parameter<UIGestureRecognizer.State>) -> Verify { return Verify(method: .m_handleNodeLongPress__node_state(`node`, `state`))}
        public static var onInputFocused: Verify { return Verify(method: .p_onInputFocused_get) }
		public static func onInputFocused(set newValue: Parameter<((_ input: DataProviding) -> (Void))?>) -> Verify { return Verify(method: .p_onInputFocused_set(newValue)) }
        public static var onInputUnfocused: Verify { return Verify(method: .p_onInputUnfocused_get) }
		public static func onInputUnfocused(set newValue: Parameter<(() -> (Void))?>) -> Verify { return Verify(method: .p_onInputUnfocused_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func handleNodeTap(_ node: Parameter<BaseNode?>, perform: @escaping (BaseNode?) -> Void) -> Perform {
            return Perform(method: .m_handleNodeTap__node(`node`), performs: perform)
        }
        public static func handleNodeLongPress(_ node: Parameter<BaseNode?>, _ state: Parameter<UIGestureRecognizer.State>, perform: @escaping (BaseNode?, UIGestureRecognizer.State) -> Void) -> Perform {
            return Perform(method: .m_handleNodeLongPress__node_state(`node`, `state`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - NodesManaging
open class NodesManagingMock: NSObject, NodesManaging, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var scene: Scene? {
		get {	invocations.append(.p_scene_get); return __p_scene ?? optionalGivenGetterValue(.p_scene_get, "NodesManagingMock - stub value for scene was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_scene = newValue }
	}
	private var __p_scene: (Scene)?

    public var prismsById: [String: Prism] {
		get {	invocations.append(.p_prismsById_get); return __p_prismsById ?? givenGetterValue(.p_prismsById_get, "NodesManagingMock - stub value for prismsById was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_prismsById = newValue }
	}
	private var __p_prismsById: ([String: Prism])?

    public var nodesById: [String: BaseNode] {
		get {	invocations.append(.p_nodesById_get); return __p_nodesById ?? givenGetterValue(.p_nodesById_get, "NodesManagingMock - stub value for nodesById was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_nodesById = newValue }
	}
	private var __p_nodesById: ([String: BaseNode])?





    open func registerScene(_ scene: Scene, sceneId: String) {
        addInvocation(.m_registerScene__scenesceneId_sceneId(Parameter<Scene>.value(`scene`), Parameter<String>.value(`sceneId`)))
		let perform = methodPerformValue(.m_registerScene__scenesceneId_sceneId(Parameter<Scene>.value(`scene`), Parameter<String>.value(`sceneId`))) as? (Scene, String) -> Void
		perform?(`scene`, `sceneId`)
    }

    open func registerPrism(_ prism: Prism, prismId: String) {
        addInvocation(.m_registerPrism__prismprismId_prismId(Parameter<Prism>.value(`prism`), Parameter<String>.value(`prismId`)))
		let perform = methodPerformValue(.m_registerPrism__prismprismId_prismId(Parameter<Prism>.value(`prism`), Parameter<String>.value(`prismId`))) as? (Prism, String) -> Void
		perform?(`prism`, `prismId`)
    }

    open func registerNode(_ node: TransformNode, nodeId: String) {
        addInvocation(.m_registerNode__nodenodeId_nodeId(Parameter<TransformNode>.value(`node`), Parameter<String>.value(`nodeId`)))
		let perform = methodPerformValue(.m_registerNode__nodenodeId_nodeId(Parameter<TransformNode>.value(`node`), Parameter<String>.value(`nodeId`))) as? (TransformNode, String) -> Void
		perform?(`node`, `nodeId`)
    }

    open func unregisterNode(_ nodeId: String) {
        addInvocation(.m_unregisterNode__nodeId(Parameter<String>.value(`nodeId`)))
		let perform = methodPerformValue(.m_unregisterNode__nodeId(Parameter<String>.value(`nodeId`))) as? (String) -> Void
		perform?(`nodeId`)
    }

    open func updateNode(_ nodeId: String, properties: [String: Any]) -> Bool {
        addInvocation(.m_updateNode__nodeIdproperties_properties(Parameter<String>.value(`nodeId`), Parameter<[String: Any]>.value(`properties`)))
		let perform = methodPerformValue(.m_updateNode__nodeIdproperties_properties(Parameter<String>.value(`nodeId`), Parameter<[String: Any]>.value(`properties`))) as? (String, [String: Any]) -> Void
		perform?(`nodeId`, `properties`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_updateNode__nodeIdproperties_properties(Parameter<String>.value(`nodeId`), Parameter<[String: Any]>.value(`properties`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for updateNode(_ nodeId: String, properties: [String: Any]). Use given")
			Failure("Stub return value not specified for updateNode(_ nodeId: String, properties: [String: Any]). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_registerScene__scenesceneId_sceneId(Parameter<Scene>, Parameter<String>)
        case m_registerPrism__prismprismId_prismId(Parameter<Prism>, Parameter<String>)
        case m_registerNode__nodenodeId_nodeId(Parameter<TransformNode>, Parameter<String>)
        case m_unregisterNode__nodeId(Parameter<String>)
        case m_updateNode__nodeIdproperties_properties(Parameter<String>, Parameter<[String: Any]>)
        case p_scene_get
        case p_prismsById_get
        case p_nodesById_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_registerScene__scenesceneId_sceneId(let lhsScene, let lhsSceneid), .m_registerScene__scenesceneId_sceneId(let rhsScene, let rhsSceneid)):
                guard Parameter.compare(lhs: lhsScene, rhs: rhsScene, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsSceneid, rhs: rhsSceneid, with: matcher) else { return false } 
                return true 
            case (.m_registerPrism__prismprismId_prismId(let lhsPrism, let lhsPrismid), .m_registerPrism__prismprismId_prismId(let rhsPrism, let rhsPrismid)):
                guard Parameter.compare(lhs: lhsPrism, rhs: rhsPrism, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPrismid, rhs: rhsPrismid, with: matcher) else { return false } 
                return true 
            case (.m_registerNode__nodenodeId_nodeId(let lhsNode, let lhsNodeid), .m_registerNode__nodenodeId_nodeId(let rhsNode, let rhsNodeid)):
                guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsNodeid, rhs: rhsNodeid, with: matcher) else { return false } 
                return true 
            case (.m_unregisterNode__nodeId(let lhsNodeid), .m_unregisterNode__nodeId(let rhsNodeid)):
                guard Parameter.compare(lhs: lhsNodeid, rhs: rhsNodeid, with: matcher) else { return false } 
                return true 
            case (.m_updateNode__nodeIdproperties_properties(let lhsNodeid, let lhsProperties), .m_updateNode__nodeIdproperties_properties(let rhsNodeid, let rhsProperties)):
                guard Parameter.compare(lhs: lhsNodeid, rhs: rhsNodeid, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsProperties, rhs: rhsProperties, with: matcher) else { return false } 
                return true 
            case (.p_scene_get,.p_scene_get): return true
            case (.p_prismsById_get,.p_prismsById_get): return true
            case (.p_nodesById_get,.p_nodesById_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_registerScene__scenesceneId_sceneId(p0, p1): return p0.intValue + p1.intValue
            case let .m_registerPrism__prismprismId_prismId(p0, p1): return p0.intValue + p1.intValue
            case let .m_registerNode__nodenodeId_nodeId(p0, p1): return p0.intValue + p1.intValue
            case let .m_unregisterNode__nodeId(p0): return p0.intValue
            case let .m_updateNode__nodeIdproperties_properties(p0, p1): return p0.intValue + p1.intValue
            case .p_scene_get: return 0
            case .p_prismsById_get: return 0
            case .p_nodesById_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func scene(getter defaultValue: Scene?...) -> PropertyStub {
            return Given(method: .p_scene_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func prismsById(getter defaultValue: [String: Prism]...) -> PropertyStub {
            return Given(method: .p_prismsById_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func nodesById(getter defaultValue: [String: BaseNode]...) -> PropertyStub {
            return Given(method: .p_nodesById_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func updateNode(_ nodeId: Parameter<String>, properties: Parameter<[String: Any]>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_updateNode__nodeIdproperties_properties(`nodeId`, `properties`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func updateNode(_ nodeId: Parameter<String>, properties: Parameter<[String: Any]>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_updateNode__nodeIdproperties_properties(`nodeId`, `properties`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func registerScene(_ scene: Parameter<Scene>, sceneId: Parameter<String>) -> Verify { return Verify(method: .m_registerScene__scenesceneId_sceneId(`scene`, `sceneId`))}
        public static func registerPrism(_ prism: Parameter<Prism>, prismId: Parameter<String>) -> Verify { return Verify(method: .m_registerPrism__prismprismId_prismId(`prism`, `prismId`))}
        public static func registerNode(_ node: Parameter<TransformNode>, nodeId: Parameter<String>) -> Verify { return Verify(method: .m_registerNode__nodenodeId_nodeId(`node`, `nodeId`))}
        public static func unregisterNode(_ nodeId: Parameter<String>) -> Verify { return Verify(method: .m_unregisterNode__nodeId(`nodeId`))}
        public static func updateNode(_ nodeId: Parameter<String>, properties: Parameter<[String: Any]>) -> Verify { return Verify(method: .m_updateNode__nodeIdproperties_properties(`nodeId`, `properties`))}
        public static var scene: Verify { return Verify(method: .p_scene_get) }
        public static var prismsById: Verify { return Verify(method: .p_prismsById_get) }
        public static var nodesById: Verify { return Verify(method: .p_nodesById_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func registerScene(_ scene: Parameter<Scene>, sceneId: Parameter<String>, perform: @escaping (Scene, String) -> Void) -> Perform {
            return Perform(method: .m_registerScene__scenesceneId_sceneId(`scene`, `sceneId`), performs: perform)
        }
        public static func registerPrism(_ prism: Parameter<Prism>, prismId: Parameter<String>, perform: @escaping (Prism, String) -> Void) -> Perform {
            return Perform(method: .m_registerPrism__prismprismId_prismId(`prism`, `prismId`), performs: perform)
        }
        public static func registerNode(_ node: Parameter<TransformNode>, nodeId: Parameter<String>, perform: @escaping (TransformNode, String) -> Void) -> Perform {
            return Perform(method: .m_registerNode__nodenodeId_nodeId(`node`, `nodeId`), performs: perform)
        }
        public static func unregisterNode(_ nodeId: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_unregisterNode__nodeId(`nodeId`), performs: perform)
        }
        public static func updateNode(_ nodeId: Parameter<String>, properties: Parameter<[String: Any]>, perform: @escaping (String, [String: Any]) -> Void) -> Perform {
            return Perform(method: .m_updateNode__nodeIdproperties_properties(`nodeId`, `properties`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - PanGestureRecognizing
open class PanGestureRecognizingMock: NSObject, PanGestureRecognizing, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var view: UIView? {
		get {	invocations.append(.p_view_get); return __p_view ?? optionalGivenGetterValue(.p_view_get, "PanGestureRecognizingMock - stub value for view was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_view = newValue }
	}
	private var __p_view: (UIView)?

    public var state: UIGestureRecognizer.State {
		get {	invocations.append(.p_state_get); return __p_state ?? givenGetterValue(.p_state_get, "PanGestureRecognizingMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (UIGestureRecognizer.State)?





    open func velocity(in view: UIView?) -> CGPoint {
        addInvocation(.m_velocity__in_view(Parameter<UIView?>.value(`view`)))
		let perform = methodPerformValue(.m_velocity__in_view(Parameter<UIView?>.value(`view`))) as? (UIView?) -> Void
		perform?(`view`)
		var __value: CGPoint
		do {
		    __value = try methodReturnValue(.m_velocity__in_view(Parameter<UIView?>.value(`view`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for velocity(in view: UIView?). Use given")
			Failure("Stub return value not specified for velocity(in view: UIView?). Use given")
		}
		return __value
    }

    open func translation(in view: UIView?) -> CGPoint {
        addInvocation(.m_translation__in_view(Parameter<UIView?>.value(`view`)))
		let perform = methodPerformValue(.m_translation__in_view(Parameter<UIView?>.value(`view`))) as? (UIView?) -> Void
		perform?(`view`)
		var __value: CGPoint
		do {
		    __value = try methodReturnValue(.m_translation__in_view(Parameter<UIView?>.value(`view`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for translation(in view: UIView?). Use given")
			Failure("Stub return value not specified for translation(in view: UIView?). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_velocity__in_view(Parameter<UIView?>)
        case m_translation__in_view(Parameter<UIView?>)
        case p_view_get
        case p_state_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_velocity__in_view(let lhsView), .m_velocity__in_view(let rhsView)):
                guard Parameter.compare(lhs: lhsView, rhs: rhsView, with: matcher) else { return false } 
                return true 
            case (.m_translation__in_view(let lhsView), .m_translation__in_view(let rhsView)):
                guard Parameter.compare(lhs: lhsView, rhs: rhsView, with: matcher) else { return false } 
                return true 
            case (.p_view_get,.p_view_get): return true
            case (.p_state_get,.p_state_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_velocity__in_view(p0): return p0.intValue
            case let .m_translation__in_view(p0): return p0.intValue
            case .p_view_get: return 0
            case .p_state_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func view(getter defaultValue: UIView?...) -> PropertyStub {
            return Given(method: .p_view_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func state(getter defaultValue: UIGestureRecognizer.State...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func velocity(in view: Parameter<UIView?>, willReturn: CGPoint...) -> MethodStub {
            return Given(method: .m_velocity__in_view(`view`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func translation(in view: Parameter<UIView?>, willReturn: CGPoint...) -> MethodStub {
            return Given(method: .m_translation__in_view(`view`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func velocity(in view: Parameter<UIView?>, willProduce: (Stubber<CGPoint>) -> Void) -> MethodStub {
            let willReturn: [CGPoint] = []
			let given: Given = { return Given(method: .m_velocity__in_view(`view`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (CGPoint).self)
			willProduce(stubber)
			return given
        }
        public static func translation(in view: Parameter<UIView?>, willProduce: (Stubber<CGPoint>) -> Void) -> MethodStub {
            let willReturn: [CGPoint] = []
			let given: Given = { return Given(method: .m_translation__in_view(`view`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (CGPoint).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func velocity(in view: Parameter<UIView?>) -> Verify { return Verify(method: .m_velocity__in_view(`view`))}
        public static func translation(in view: Parameter<UIView?>) -> Verify { return Verify(method: .m_translation__in_view(`view`))}
        public static var view: Verify { return Verify(method: .p_view_get) }
        public static var state: Verify { return Verify(method: .p_state_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func velocity(in view: Parameter<UIView?>, perform: @escaping (UIView?) -> Void) -> Perform {
            return Perform(method: .m_velocity__in_view(`view`), performs: perform)
        }
        public static func translation(in view: Parameter<UIView?>, perform: @escaping (UIView?) -> Void) -> Perform {
            return Perform(method: .m_translation__in_view(`view`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - PinchGestureRecognizing
open class PinchGestureRecognizingMock: NSObject, PinchGestureRecognizing, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var scale: CGFloat {
		get {	invocations.append(.p_scale_get); return __p_scale ?? givenGetterValue(.p_scale_get, "PinchGestureRecognizingMock - stub value for scale was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_scale = newValue }
	}
	private var __p_scale: (CGFloat)?

    public var velocity: CGFloat {
		get {	invocations.append(.p_velocity_get); return __p_velocity ?? givenGetterValue(.p_velocity_get, "PinchGestureRecognizingMock - stub value for velocity was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_velocity = newValue }
	}
	private var __p_velocity: (CGFloat)?

    public var view: UIView? {
		get {	invocations.append(.p_view_get); return __p_view ?? optionalGivenGetterValue(.p_view_get, "PinchGestureRecognizingMock - stub value for view was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_view = newValue }
	}
	private var __p_view: (UIView)?

    public var state: UIGestureRecognizer.State {
		get {	invocations.append(.p_state_get); return __p_state ?? givenGetterValue(.p_state_get, "PinchGestureRecognizingMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (UIGestureRecognizer.State)?






    fileprivate enum MethodType {
        case p_scale_get
        case p_velocity_get
        case p_view_get
        case p_state_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_scale_get,.p_scale_get): return true
            case (.p_velocity_get,.p_velocity_get): return true
            case (.p_view_get,.p_view_get): return true
            case (.p_state_get,.p_state_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_scale_get: return 0
            case .p_velocity_get: return 0
            case .p_view_get: return 0
            case .p_state_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func scale(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_scale_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func velocity(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_velocity_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func view(getter defaultValue: UIView?...) -> PropertyStub {
            return Given(method: .p_view_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func state(getter defaultValue: UIGestureRecognizer.State...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var scale: Verify { return Verify(method: .p_scale_get) }
        public static var velocity: Verify { return Verify(method: .p_velocity_get) }
        public static var view: Verify { return Verify(method: .p_view_get) }
        public static var state: Verify { return Verify(method: .p_state_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - PrismInteracting
open class PrismInteractingMock: PrismInteracting, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func toggleInteractions(for prism: Prism) {
        addInvocation(.m_toggleInteractions__for_prism(Parameter<Prism>.value(`prism`)))
		let perform = methodPerformValue(.m_toggleInteractions__for_prism(Parameter<Prism>.value(`prism`))) as? (Prism) -> Void
		perform?(`prism`)
    }

    open func startInteractions(for prism: Prism) {
        addInvocation(.m_startInteractions__for_prism(Parameter<Prism>.value(`prism`)))
		let perform = methodPerformValue(.m_startInteractions__for_prism(Parameter<Prism>.value(`prism`))) as? (Prism) -> Void
		perform?(`prism`)
    }

    open func update(cameraNode: SCNNode, time: TimeInterval) {
        addInvocation(.m_update__cameraNode_cameraNodetime_time(Parameter<SCNNode>.value(`cameraNode`), Parameter<TimeInterval>.value(`time`)))
		let perform = methodPerformValue(.m_update__cameraNode_cameraNodetime_time(Parameter<SCNNode>.value(`cameraNode`), Parameter<TimeInterval>.value(`time`))) as? (SCNNode, TimeInterval) -> Void
		perform?(`cameraNode`, `time`)
    }

    open func stopInteractions(for prism: Prism) {
        addInvocation(.m_stopInteractions__for_prism(Parameter<Prism>.value(`prism`)))
		let perform = methodPerformValue(.m_stopInteractions__for_prism(Parameter<Prism>.value(`prism`))) as? (Prism) -> Void
		perform?(`prism`)
    }


    fileprivate enum MethodType {
        case m_toggleInteractions__for_prism(Parameter<Prism>)
        case m_startInteractions__for_prism(Parameter<Prism>)
        case m_update__cameraNode_cameraNodetime_time(Parameter<SCNNode>, Parameter<TimeInterval>)
        case m_stopInteractions__for_prism(Parameter<Prism>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_toggleInteractions__for_prism(let lhsPrism), .m_toggleInteractions__for_prism(let rhsPrism)):
                guard Parameter.compare(lhs: lhsPrism, rhs: rhsPrism, with: matcher) else { return false } 
                return true 
            case (.m_startInteractions__for_prism(let lhsPrism), .m_startInteractions__for_prism(let rhsPrism)):
                guard Parameter.compare(lhs: lhsPrism, rhs: rhsPrism, with: matcher) else { return false } 
                return true 
            case (.m_update__cameraNode_cameraNodetime_time(let lhsCameranode, let lhsTime), .m_update__cameraNode_cameraNodetime_time(let rhsCameranode, let rhsTime)):
                guard Parameter.compare(lhs: lhsCameranode, rhs: rhsCameranode, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsTime, rhs: rhsTime, with: matcher) else { return false } 
                return true 
            case (.m_stopInteractions__for_prism(let lhsPrism), .m_stopInteractions__for_prism(let rhsPrism)):
                guard Parameter.compare(lhs: lhsPrism, rhs: rhsPrism, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_toggleInteractions__for_prism(p0): return p0.intValue
            case let .m_startInteractions__for_prism(p0): return p0.intValue
            case let .m_update__cameraNode_cameraNodetime_time(p0, p1): return p0.intValue + p1.intValue
            case let .m_stopInteractions__for_prism(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func toggleInteractions(for prism: Parameter<Prism>) -> Verify { return Verify(method: .m_toggleInteractions__for_prism(`prism`))}
        public static func startInteractions(for prism: Parameter<Prism>) -> Verify { return Verify(method: .m_startInteractions__for_prism(`prism`))}
        public static func update(cameraNode: Parameter<SCNNode>, time: Parameter<TimeInterval>) -> Verify { return Verify(method: .m_update__cameraNode_cameraNodetime_time(`cameraNode`, `time`))}
        public static func stopInteractions(for prism: Parameter<Prism>) -> Verify { return Verify(method: .m_stopInteractions__for_prism(`prism`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func toggleInteractions(for prism: Parameter<Prism>, perform: @escaping (Prism) -> Void) -> Perform {
            return Perform(method: .m_toggleInteractions__for_prism(`prism`), performs: perform)
        }
        public static func startInteractions(for prism: Parameter<Prism>, perform: @escaping (Prism) -> Void) -> Perform {
            return Perform(method: .m_startInteractions__for_prism(`prism`), performs: perform)
        }
        public static func update(cameraNode: Parameter<SCNNode>, time: Parameter<TimeInterval>, perform: @escaping (SCNNode, TimeInterval) -> Void) -> Perform {
            return Perform(method: .m_update__cameraNode_cameraNodetime_time(`cameraNode`, `time`), performs: perform)
        }
        public static func stopInteractions(for prism: Parameter<Prism>, perform: @escaping (Prism) -> Void) -> Perform {
            return Perform(method: .m_stopInteractions__for_prism(`prism`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - PrismInteractingDelegate
open class PrismInteractingDelegateMock: PrismInteractingDelegate, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func onPrismUpdated(prism: Prism) {
        addInvocation(.m_onPrismUpdated__prism_prism(Parameter<Prism>.value(`prism`)))
		let perform = methodPerformValue(.m_onPrismUpdated__prism_prism(Parameter<Prism>.value(`prism`))) as? (Prism) -> Void
		perform?(`prism`)
    }


    fileprivate enum MethodType {
        case m_onPrismUpdated__prism_prism(Parameter<Prism>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_onPrismUpdated__prism_prism(let lhsPrism), .m_onPrismUpdated__prism_prism(let rhsPrism)):
                guard Parameter.compare(lhs: lhsPrism, rhs: rhsPrism, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_onPrismUpdated__prism_prism(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func onPrismUpdated(prism: Parameter<Prism>) -> Verify { return Verify(method: .m_onPrismUpdated__prism_prism(`prism`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func onPrismUpdated(prism: Parameter<Prism>, perform: @escaping (Prism) -> Void) -> Perform {
            return Perform(method: .m_onPrismUpdated__prism_prism(`prism`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - RCTARViewObserving
open class RCTARViewObservingMock: NSObject, RCTARViewObserving, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        addInvocation(.m_renderer__rendererdidAdd_nodefor_anchor(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNNode>.value(`node`), Parameter<ARAnchor>.value(`anchor`)))
		let perform = methodPerformValue(.m_renderer__rendererdidAdd_nodefor_anchor(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNNode>.value(`node`), Parameter<ARAnchor>.value(`anchor`))) as? (SCNSceneRenderer, SCNNode, ARAnchor) -> Void
		perform?(`renderer`, `node`, `anchor`)
    }

    open func renderer(_ renderer: SCNSceneRenderer, willUpdate node: SCNNode, for anchor: ARAnchor) {
        addInvocation(.m_renderer__rendererwillUpdate_nodefor_anchor(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNNode>.value(`node`), Parameter<ARAnchor>.value(`anchor`)))
		let perform = methodPerformValue(.m_renderer__rendererwillUpdate_nodefor_anchor(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNNode>.value(`node`), Parameter<ARAnchor>.value(`anchor`))) as? (SCNSceneRenderer, SCNNode, ARAnchor) -> Void
		perform?(`renderer`, `node`, `anchor`)
    }

    open func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        addInvocation(.m_renderer__rendererdidUpdate_nodefor_anchor(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNNode>.value(`node`), Parameter<ARAnchor>.value(`anchor`)))
		let perform = methodPerformValue(.m_renderer__rendererdidUpdate_nodefor_anchor(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNNode>.value(`node`), Parameter<ARAnchor>.value(`anchor`))) as? (SCNSceneRenderer, SCNNode, ARAnchor) -> Void
		perform?(`renderer`, `node`, `anchor`)
    }

    open func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        addInvocation(.m_renderer__rendererdidRemove_nodefor_anchor(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNNode>.value(`node`), Parameter<ARAnchor>.value(`anchor`)))
		let perform = methodPerformValue(.m_renderer__rendererdidRemove_nodefor_anchor(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNNode>.value(`node`), Parameter<ARAnchor>.value(`anchor`))) as? (SCNSceneRenderer, SCNNode, ARAnchor) -> Void
		perform?(`renderer`, `node`, `anchor`)
    }

    open func session(_ session: ARSession, didFailWithError error: Error) {
        addInvocation(.m_session__sessiondidFailWithError_error(Parameter<ARSession>.value(`session`), Parameter<Error>.value(`error`)))
		let perform = methodPerformValue(.m_session__sessiondidFailWithError_error(Parameter<ARSession>.value(`session`), Parameter<Error>.value(`error`))) as? (ARSession, Error) -> Void
		perform?(`session`, `error`)
    }

    open func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        addInvocation(.m_session__sessioncameraDidChangeTrackingState_camera(Parameter<ARSession>.value(`session`), Parameter<ARCamera>.value(`camera`)))
		let perform = methodPerformValue(.m_session__sessioncameraDidChangeTrackingState_camera(Parameter<ARSession>.value(`session`), Parameter<ARCamera>.value(`camera`))) as? (ARSession, ARCamera) -> Void
		perform?(`session`, `camera`)
    }

    open func sessionWasInterrupted(_ session: ARSession) {
        addInvocation(.m_sessionWasInterrupted__session(Parameter<ARSession>.value(`session`)))
		let perform = methodPerformValue(.m_sessionWasInterrupted__session(Parameter<ARSession>.value(`session`))) as? (ARSession) -> Void
		perform?(`session`)
    }

    open func sessionInterruptionEnded(_ session: ARSession) {
        addInvocation(.m_sessionInterruptionEnded__session(Parameter<ARSession>.value(`session`)))
		let perform = methodPerformValue(.m_sessionInterruptionEnded__session(Parameter<ARSession>.value(`session`))) as? (ARSession) -> Void
		perform?(`session`)
    }

    open func session(_ session: ARSession, didOutputAudioSampleBuffer audioSampleBuffer: CMSampleBuffer) {
        addInvocation(.m_session__sessiondidOutputAudioSampleBuffer_audioSampleBuffer(Parameter<ARSession>.value(`session`), Parameter<CMSampleBuffer>.value(`audioSampleBuffer`)))
		let perform = methodPerformValue(.m_session__sessiondidOutputAudioSampleBuffer_audioSampleBuffer(Parameter<ARSession>.value(`session`), Parameter<CMSampleBuffer>.value(`audioSampleBuffer`))) as? (ARSession, CMSampleBuffer) -> Void
		perform?(`session`, `audioSampleBuffer`)
    }

    open func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        addInvocation(.m_renderer__rendererupdateAtTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<TimeInterval>.value(`time`)))
		let perform = methodPerformValue(.m_renderer__rendererupdateAtTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<TimeInterval>.value(`time`))) as? (SCNSceneRenderer, TimeInterval) -> Void
		perform?(`renderer`, `time`)
    }

    open func renderer(_ renderer: SCNSceneRenderer, didApplyAnimationsAtTime time: TimeInterval) {
        addInvocation(.m_renderer__rendererdidApplyAnimationsAtTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<TimeInterval>.value(`time`)))
		let perform = methodPerformValue(.m_renderer__rendererdidApplyAnimationsAtTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<TimeInterval>.value(`time`))) as? (SCNSceneRenderer, TimeInterval) -> Void
		perform?(`renderer`, `time`)
    }

    open func renderer(_ renderer: SCNSceneRenderer, didSimulatePhysicsAtTime time: TimeInterval) {
        addInvocation(.m_renderer__rendererdidSimulatePhysicsAtTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<TimeInterval>.value(`time`)))
		let perform = methodPerformValue(.m_renderer__rendererdidSimulatePhysicsAtTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<TimeInterval>.value(`time`))) as? (SCNSceneRenderer, TimeInterval) -> Void
		perform?(`renderer`, `time`)
    }

    open func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        addInvocation(.m_renderer__rendererwillRenderScene_sceneatTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNScene>.value(`scene`), Parameter<TimeInterval>.value(`time`)))
		let perform = methodPerformValue(.m_renderer__rendererwillRenderScene_sceneatTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNScene>.value(`scene`), Parameter<TimeInterval>.value(`time`))) as? (SCNSceneRenderer, SCNScene, TimeInterval) -> Void
		perform?(`renderer`, `scene`, `time`)
    }

    open func renderer(_ renderer: SCNSceneRenderer, didRenderScene scene: SCNScene, atTime time: TimeInterval) {
        addInvocation(.m_renderer__rendererdidRenderScene_sceneatTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNScene>.value(`scene`), Parameter<TimeInterval>.value(`time`)))
		let perform = methodPerformValue(.m_renderer__rendererdidRenderScene_sceneatTime_time(Parameter<SCNSceneRenderer>.value(`renderer`), Parameter<SCNScene>.value(`scene`), Parameter<TimeInterval>.value(`time`))) as? (SCNSceneRenderer, SCNScene, TimeInterval) -> Void
		perform?(`renderer`, `scene`, `time`)
    }


    fileprivate enum MethodType {
        case m_renderer__rendererdidAdd_nodefor_anchor(Parameter<SCNSceneRenderer>, Parameter<SCNNode>, Parameter<ARAnchor>)
        case m_renderer__rendererwillUpdate_nodefor_anchor(Parameter<SCNSceneRenderer>, Parameter<SCNNode>, Parameter<ARAnchor>)
        case m_renderer__rendererdidUpdate_nodefor_anchor(Parameter<SCNSceneRenderer>, Parameter<SCNNode>, Parameter<ARAnchor>)
        case m_renderer__rendererdidRemove_nodefor_anchor(Parameter<SCNSceneRenderer>, Parameter<SCNNode>, Parameter<ARAnchor>)
        case m_session__sessiondidFailWithError_error(Parameter<ARSession>, Parameter<Error>)
        case m_session__sessioncameraDidChangeTrackingState_camera(Parameter<ARSession>, Parameter<ARCamera>)
        case m_sessionWasInterrupted__session(Parameter<ARSession>)
        case m_sessionInterruptionEnded__session(Parameter<ARSession>)
        case m_session__sessiondidOutputAudioSampleBuffer_audioSampleBuffer(Parameter<ARSession>, Parameter<CMSampleBuffer>)
        case m_renderer__rendererupdateAtTime_time(Parameter<SCNSceneRenderer>, Parameter<TimeInterval>)
        case m_renderer__rendererdidApplyAnimationsAtTime_time(Parameter<SCNSceneRenderer>, Parameter<TimeInterval>)
        case m_renderer__rendererdidSimulatePhysicsAtTime_time(Parameter<SCNSceneRenderer>, Parameter<TimeInterval>)
        case m_renderer__rendererwillRenderScene_sceneatTime_time(Parameter<SCNSceneRenderer>, Parameter<SCNScene>, Parameter<TimeInterval>)
        case m_renderer__rendererdidRenderScene_sceneatTime_time(Parameter<SCNSceneRenderer>, Parameter<SCNScene>, Parameter<TimeInterval>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_renderer__rendererdidAdd_nodefor_anchor(let lhsRenderer, let lhsNode, let lhsAnchor), .m_renderer__rendererdidAdd_nodefor_anchor(let rhsRenderer, let rhsNode, let rhsAnchor)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsAnchor, rhs: rhsAnchor, with: matcher) else { return false } 
                return true 
            case (.m_renderer__rendererwillUpdate_nodefor_anchor(let lhsRenderer, let lhsNode, let lhsAnchor), .m_renderer__rendererwillUpdate_nodefor_anchor(let rhsRenderer, let rhsNode, let rhsAnchor)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsAnchor, rhs: rhsAnchor, with: matcher) else { return false } 
                return true 
            case (.m_renderer__rendererdidUpdate_nodefor_anchor(let lhsRenderer, let lhsNode, let lhsAnchor), .m_renderer__rendererdidUpdate_nodefor_anchor(let rhsRenderer, let rhsNode, let rhsAnchor)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsAnchor, rhs: rhsAnchor, with: matcher) else { return false } 
                return true 
            case (.m_renderer__rendererdidRemove_nodefor_anchor(let lhsRenderer, let lhsNode, let lhsAnchor), .m_renderer__rendererdidRemove_nodefor_anchor(let rhsRenderer, let rhsNode, let rhsAnchor)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsNode, rhs: rhsNode, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsAnchor, rhs: rhsAnchor, with: matcher) else { return false } 
                return true 
            case (.m_session__sessiondidFailWithError_error(let lhsSession, let lhsError), .m_session__sessiondidFailWithError_error(let rhsSession, let rhsError)):
                guard Parameter.compare(lhs: lhsSession, rhs: rhsSession, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                return true 
            case (.m_session__sessioncameraDidChangeTrackingState_camera(let lhsSession, let lhsCamera), .m_session__sessioncameraDidChangeTrackingState_camera(let rhsSession, let rhsCamera)):
                guard Parameter.compare(lhs: lhsSession, rhs: rhsSession, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCamera, rhs: rhsCamera, with: matcher) else { return false } 
                return true 
            case (.m_sessionWasInterrupted__session(let lhsSession), .m_sessionWasInterrupted__session(let rhsSession)):
                guard Parameter.compare(lhs: lhsSession, rhs: rhsSession, with: matcher) else { return false } 
                return true 
            case (.m_sessionInterruptionEnded__session(let lhsSession), .m_sessionInterruptionEnded__session(let rhsSession)):
                guard Parameter.compare(lhs: lhsSession, rhs: rhsSession, with: matcher) else { return false } 
                return true 
            case (.m_session__sessiondidOutputAudioSampleBuffer_audioSampleBuffer(let lhsSession, let lhsAudiosamplebuffer), .m_session__sessiondidOutputAudioSampleBuffer_audioSampleBuffer(let rhsSession, let rhsAudiosamplebuffer)):
                guard Parameter.compare(lhs: lhsSession, rhs: rhsSession, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsAudiosamplebuffer, rhs: rhsAudiosamplebuffer, with: matcher) else { return false } 
                return true 
            case (.m_renderer__rendererupdateAtTime_time(let lhsRenderer, let lhsTime), .m_renderer__rendererupdateAtTime_time(let rhsRenderer, let rhsTime)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsTime, rhs: rhsTime, with: matcher) else { return false } 
                return true 
            case (.m_renderer__rendererdidApplyAnimationsAtTime_time(let lhsRenderer, let lhsTime), .m_renderer__rendererdidApplyAnimationsAtTime_time(let rhsRenderer, let rhsTime)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsTime, rhs: rhsTime, with: matcher) else { return false } 
                return true 
            case (.m_renderer__rendererdidSimulatePhysicsAtTime_time(let lhsRenderer, let lhsTime), .m_renderer__rendererdidSimulatePhysicsAtTime_time(let rhsRenderer, let rhsTime)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsTime, rhs: rhsTime, with: matcher) else { return false } 
                return true 
            case (.m_renderer__rendererwillRenderScene_sceneatTime_time(let lhsRenderer, let lhsScene, let lhsTime), .m_renderer__rendererwillRenderScene_sceneatTime_time(let rhsRenderer, let rhsScene, let rhsTime)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsScene, rhs: rhsScene, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsTime, rhs: rhsTime, with: matcher) else { return false } 
                return true 
            case (.m_renderer__rendererdidRenderScene_sceneatTime_time(let lhsRenderer, let lhsScene, let lhsTime), .m_renderer__rendererdidRenderScene_sceneatTime_time(let rhsRenderer, let rhsScene, let rhsTime)):
                guard Parameter.compare(lhs: lhsRenderer, rhs: rhsRenderer, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsScene, rhs: rhsScene, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsTime, rhs: rhsTime, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_renderer__rendererdidAdd_nodefor_anchor(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_renderer__rendererwillUpdate_nodefor_anchor(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_renderer__rendererdidUpdate_nodefor_anchor(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_renderer__rendererdidRemove_nodefor_anchor(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_session__sessiondidFailWithError_error(p0, p1): return p0.intValue + p1.intValue
            case let .m_session__sessioncameraDidChangeTrackingState_camera(p0, p1): return p0.intValue + p1.intValue
            case let .m_sessionWasInterrupted__session(p0): return p0.intValue
            case let .m_sessionInterruptionEnded__session(p0): return p0.intValue
            case let .m_session__sessiondidOutputAudioSampleBuffer_audioSampleBuffer(p0, p1): return p0.intValue + p1.intValue
            case let .m_renderer__rendererupdateAtTime_time(p0, p1): return p0.intValue + p1.intValue
            case let .m_renderer__rendererdidApplyAnimationsAtTime_time(p0, p1): return p0.intValue + p1.intValue
            case let .m_renderer__rendererdidSimulatePhysicsAtTime_time(p0, p1): return p0.intValue + p1.intValue
            case let .m_renderer__rendererwillRenderScene_sceneatTime_time(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_renderer__rendererdidRenderScene_sceneatTime_time(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didAdd node: Parameter<SCNNode>, for anchor: Parameter<ARAnchor>) -> Verify { return Verify(method: .m_renderer__rendererdidAdd_nodefor_anchor(`renderer`, `node`, `anchor`))}
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, willUpdate node: Parameter<SCNNode>, for anchor: Parameter<ARAnchor>) -> Verify { return Verify(method: .m_renderer__rendererwillUpdate_nodefor_anchor(`renderer`, `node`, `anchor`))}
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didUpdate node: Parameter<SCNNode>, for anchor: Parameter<ARAnchor>) -> Verify { return Verify(method: .m_renderer__rendererdidUpdate_nodefor_anchor(`renderer`, `node`, `anchor`))}
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didRemove node: Parameter<SCNNode>, for anchor: Parameter<ARAnchor>) -> Verify { return Verify(method: .m_renderer__rendererdidRemove_nodefor_anchor(`renderer`, `node`, `anchor`))}
        public static func session(_ session: Parameter<ARSession>, didFailWithError error: Parameter<Error>) -> Verify { return Verify(method: .m_session__sessiondidFailWithError_error(`session`, `error`))}
        public static func session(_ session: Parameter<ARSession>, cameraDidChangeTrackingState camera: Parameter<ARCamera>) -> Verify { return Verify(method: .m_session__sessioncameraDidChangeTrackingState_camera(`session`, `camera`))}
        public static func sessionWasInterrupted(_ session: Parameter<ARSession>) -> Verify { return Verify(method: .m_sessionWasInterrupted__session(`session`))}
        public static func sessionInterruptionEnded(_ session: Parameter<ARSession>) -> Verify { return Verify(method: .m_sessionInterruptionEnded__session(`session`))}
        public static func session(_ session: Parameter<ARSession>, didOutputAudioSampleBuffer audioSampleBuffer: Parameter<CMSampleBuffer>) -> Verify { return Verify(method: .m_session__sessiondidOutputAudioSampleBuffer_audioSampleBuffer(`session`, `audioSampleBuffer`))}
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, updateAtTime time: Parameter<TimeInterval>) -> Verify { return Verify(method: .m_renderer__rendererupdateAtTime_time(`renderer`, `time`))}
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didApplyAnimationsAtTime time: Parameter<TimeInterval>) -> Verify { return Verify(method: .m_renderer__rendererdidApplyAnimationsAtTime_time(`renderer`, `time`))}
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didSimulatePhysicsAtTime time: Parameter<TimeInterval>) -> Verify { return Verify(method: .m_renderer__rendererdidSimulatePhysicsAtTime_time(`renderer`, `time`))}
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, willRenderScene scene: Parameter<SCNScene>, atTime time: Parameter<TimeInterval>) -> Verify { return Verify(method: .m_renderer__rendererwillRenderScene_sceneatTime_time(`renderer`, `scene`, `time`))}
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didRenderScene scene: Parameter<SCNScene>, atTime time: Parameter<TimeInterval>) -> Verify { return Verify(method: .m_renderer__rendererdidRenderScene_sceneatTime_time(`renderer`, `scene`, `time`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didAdd node: Parameter<SCNNode>, for anchor: Parameter<ARAnchor>, perform: @escaping (SCNSceneRenderer, SCNNode, ARAnchor) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererdidAdd_nodefor_anchor(`renderer`, `node`, `anchor`), performs: perform)
        }
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, willUpdate node: Parameter<SCNNode>, for anchor: Parameter<ARAnchor>, perform: @escaping (SCNSceneRenderer, SCNNode, ARAnchor) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererwillUpdate_nodefor_anchor(`renderer`, `node`, `anchor`), performs: perform)
        }
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didUpdate node: Parameter<SCNNode>, for anchor: Parameter<ARAnchor>, perform: @escaping (SCNSceneRenderer, SCNNode, ARAnchor) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererdidUpdate_nodefor_anchor(`renderer`, `node`, `anchor`), performs: perform)
        }
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didRemove node: Parameter<SCNNode>, for anchor: Parameter<ARAnchor>, perform: @escaping (SCNSceneRenderer, SCNNode, ARAnchor) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererdidRemove_nodefor_anchor(`renderer`, `node`, `anchor`), performs: perform)
        }
        public static func session(_ session: Parameter<ARSession>, didFailWithError error: Parameter<Error>, perform: @escaping (ARSession, Error) -> Void) -> Perform {
            return Perform(method: .m_session__sessiondidFailWithError_error(`session`, `error`), performs: perform)
        }
        public static func session(_ session: Parameter<ARSession>, cameraDidChangeTrackingState camera: Parameter<ARCamera>, perform: @escaping (ARSession, ARCamera) -> Void) -> Perform {
            return Perform(method: .m_session__sessioncameraDidChangeTrackingState_camera(`session`, `camera`), performs: perform)
        }
        public static func sessionWasInterrupted(_ session: Parameter<ARSession>, perform: @escaping (ARSession) -> Void) -> Perform {
            return Perform(method: .m_sessionWasInterrupted__session(`session`), performs: perform)
        }
        public static func sessionInterruptionEnded(_ session: Parameter<ARSession>, perform: @escaping (ARSession) -> Void) -> Perform {
            return Perform(method: .m_sessionInterruptionEnded__session(`session`), performs: perform)
        }
        public static func session(_ session: Parameter<ARSession>, didOutputAudioSampleBuffer audioSampleBuffer: Parameter<CMSampleBuffer>, perform: @escaping (ARSession, CMSampleBuffer) -> Void) -> Perform {
            return Perform(method: .m_session__sessiondidOutputAudioSampleBuffer_audioSampleBuffer(`session`, `audioSampleBuffer`), performs: perform)
        }
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, updateAtTime time: Parameter<TimeInterval>, perform: @escaping (SCNSceneRenderer, TimeInterval) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererupdateAtTime_time(`renderer`, `time`), performs: perform)
        }
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didApplyAnimationsAtTime time: Parameter<TimeInterval>, perform: @escaping (SCNSceneRenderer, TimeInterval) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererdidApplyAnimationsAtTime_time(`renderer`, `time`), performs: perform)
        }
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didSimulatePhysicsAtTime time: Parameter<TimeInterval>, perform: @escaping (SCNSceneRenderer, TimeInterval) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererdidSimulatePhysicsAtTime_time(`renderer`, `time`), performs: perform)
        }
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, willRenderScene scene: Parameter<SCNScene>, atTime time: Parameter<TimeInterval>, perform: @escaping (SCNSceneRenderer, SCNScene, TimeInterval) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererwillRenderScene_sceneatTime_time(`renderer`, `scene`, `time`), performs: perform)
        }
        public static func renderer(_ renderer: Parameter<SCNSceneRenderer>, didRenderScene scene: Parameter<SCNScene>, atTime time: Parameter<TimeInterval>, perform: @escaping (SCNSceneRenderer, SCNScene, TimeInterval) -> Void) -> Perform {
            return Perform(method: .m_renderer__rendererdidRenderScene_sceneatTime_time(`renderer`, `scene`, `time`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - RayBuilding
open class RayBuildingMock: RayBuilding, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func build(gesture: UIGestureRecognizer, cameraNode: SCNNode) -> Ray? {
        addInvocation(.m_build__gesture_gesturecameraNode_cameraNode(Parameter<UIGestureRecognizer>.value(`gesture`), Parameter<SCNNode>.value(`cameraNode`)))
		let perform = methodPerformValue(.m_build__gesture_gesturecameraNode_cameraNode(Parameter<UIGestureRecognizer>.value(`gesture`), Parameter<SCNNode>.value(`cameraNode`))) as? (UIGestureRecognizer, SCNNode) -> Void
		perform?(`gesture`, `cameraNode`)
		var __value: Ray? = nil
		do {
		    __value = try methodReturnValue(.m_build__gesture_gesturecameraNode_cameraNode(Parameter<UIGestureRecognizer>.value(`gesture`), Parameter<SCNNode>.value(`cameraNode`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_build__gesture_gesturecameraNode_cameraNode(Parameter<UIGestureRecognizer>, Parameter<SCNNode>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_build__gesture_gesturecameraNode_cameraNode(let lhsGesture, let lhsCameranode), .m_build__gesture_gesturecameraNode_cameraNode(let rhsGesture, let rhsCameranode)):
                guard Parameter.compare(lhs: lhsGesture, rhs: rhsGesture, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCameranode, rhs: rhsCameranode, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_build__gesture_gesturecameraNode_cameraNode(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func build(gesture: Parameter<UIGestureRecognizer>, cameraNode: Parameter<SCNNode>, willReturn: Ray?...) -> MethodStub {
            return Given(method: .m_build__gesture_gesturecameraNode_cameraNode(`gesture`, `cameraNode`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func build(gesture: Parameter<UIGestureRecognizer>, cameraNode: Parameter<SCNNode>, willProduce: (Stubber<Ray?>) -> Void) -> MethodStub {
            let willReturn: [Ray?] = []
			let given: Given = { return Given(method: .m_build__gesture_gesturecameraNode_cameraNode(`gesture`, `cameraNode`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Ray?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func build(gesture: Parameter<UIGestureRecognizer>, cameraNode: Parameter<SCNNode>) -> Verify { return Verify(method: .m_build__gesture_gesturecameraNode_cameraNode(`gesture`, `cameraNode`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func build(gesture: Parameter<UIGestureRecognizer>, cameraNode: Parameter<SCNNode>, perform: @escaping (UIGestureRecognizer, SCNNode) -> Void) -> Perform {
            return Perform(method: .m_build__gesture_gesturecameraNode_cameraNode(`gesture`, `cameraNode`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - RotationGestureRecognizing
open class RotationGestureRecognizingMock: NSObject, RotationGestureRecognizing, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var rotation: CGFloat {
		get {	invocations.append(.p_rotation_get); return __p_rotation ?? givenGetterValue(.p_rotation_get, "RotationGestureRecognizingMock - stub value for rotation was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_rotation = newValue }
	}
	private var __p_rotation: (CGFloat)?

    public var velocity: CGFloat {
		get {	invocations.append(.p_velocity_get); return __p_velocity ?? givenGetterValue(.p_velocity_get, "RotationGestureRecognizingMock - stub value for velocity was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_velocity = newValue }
	}
	private var __p_velocity: (CGFloat)?

    public var view: UIView? {
		get {	invocations.append(.p_view_get); return __p_view ?? optionalGivenGetterValue(.p_view_get, "RotationGestureRecognizingMock - stub value for view was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_view = newValue }
	}
	private var __p_view: (UIView)?

    public var state: UIGestureRecognizer.State {
		get {	invocations.append(.p_state_get); return __p_state ?? givenGetterValue(.p_state_get, "RotationGestureRecognizingMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (UIGestureRecognizer.State)?






    fileprivate enum MethodType {
        case p_rotation_get
        case p_velocity_get
        case p_view_get
        case p_state_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_rotation_get,.p_rotation_get): return true
            case (.p_velocity_get,.p_velocity_get): return true
            case (.p_view_get,.p_view_get): return true
            case (.p_state_get,.p_state_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_rotation_get: return 0
            case .p_velocity_get: return 0
            case .p_view_get: return 0
            case .p_state_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func rotation(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_rotation_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func velocity(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_velocity_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func view(getter defaultValue: UIView?...) -> PropertyStub {
            return Given(method: .p_view_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func state(getter defaultValue: UIGestureRecognizer.State...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var rotation: Verify { return Verify(method: .p_rotation_get) }
        public static var velocity: Verify { return Verify(method: .p_velocity_get) }
        public static var view: Verify { return Verify(method: .p_view_get) }
        public static var state: Verify { return Verify(method: .p_state_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - SceneInteracting
open class SceneInteractingMock: SceneInteracting, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func onUpdate(pointOfView: SCNNode, atTime: TimeInterval) {
        addInvocation(.m_onUpdate__pointOfView_pointOfViewatTime_atTime(Parameter<SCNNode>.value(`pointOfView`), Parameter<TimeInterval>.value(`atTime`)))
		let perform = methodPerformValue(.m_onUpdate__pointOfView_pointOfViewatTime_atTime(Parameter<SCNNode>.value(`pointOfView`), Parameter<TimeInterval>.value(`atTime`))) as? (SCNNode, TimeInterval) -> Void
		perform?(`pointOfView`, `atTime`)
    }


    fileprivate enum MethodType {
        case m_onUpdate__pointOfView_pointOfViewatTime_atTime(Parameter<SCNNode>, Parameter<TimeInterval>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_onUpdate__pointOfView_pointOfViewatTime_atTime(let lhsPointofview, let lhsAttime), .m_onUpdate__pointOfView_pointOfViewatTime_atTime(let rhsPointofview, let rhsAttime)):
                guard Parameter.compare(lhs: lhsPointofview, rhs: rhsPointofview, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsAttime, rhs: rhsAttime, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_onUpdate__pointOfView_pointOfViewatTime_atTime(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func onUpdate(pointOfView: Parameter<SCNNode>, atTime: Parameter<TimeInterval>) -> Verify { return Verify(method: .m_onUpdate__pointOfView_pointOfViewatTime_atTime(`pointOfView`, `atTime`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func onUpdate(pointOfView: Parameter<SCNNode>, atTime: Parameter<TimeInterval>, perform: @escaping (SCNNode, TimeInterval) -> Void) -> Perform {
            return Perform(method: .m_onUpdate__pointOfView_pointOfViewatTime_atTime(`pointOfView`, `atTime`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - SceneInteractingDelegate
open class SceneInteractingDelegateMock: SceneInteractingDelegate, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func onSceneUpdate(scene: Scene) {
        addInvocation(.m_onSceneUpdate__scene_scene(Parameter<Scene>.value(`scene`)))
		let perform = methodPerformValue(.m_onSceneUpdate__scene_scene(Parameter<Scene>.value(`scene`))) as? (Scene) -> Void
		perform?(`scene`)
    }


    fileprivate enum MethodType {
        case m_onSceneUpdate__scene_scene(Parameter<Scene>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_onSceneUpdate__scene_scene(let lhsScene), .m_onSceneUpdate__scene_scene(let rhsScene)):
                guard Parameter.compare(lhs: lhsScene, rhs: rhsScene, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_onSceneUpdate__scene_scene(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func onSceneUpdate(scene: Parameter<Scene>) -> Verify { return Verify(method: .m_onSceneUpdate__scene_scene(`scene`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func onSceneUpdate(scene: Parameter<Scene>, perform: @escaping (Scene) -> Void) -> Perform {
            return Perform(method: .m_onSceneUpdate__scene_scene(`scene`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - SliderDataProviding
open class SliderDataProvidingMock: SliderDataProviding, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var sliderValue: CGFloat {
		get {	invocations.append(.p_sliderValue_get); return __p_sliderValue ?? givenGetterValue(.p_sliderValue_get, "SliderDataProvidingMock - stub value for sliderValue was not defined") }
		set {	invocations.append(.p_sliderValue_set(.value(newValue))); __p_sliderValue = newValue }
	}
	private var __p_sliderValue: (CGFloat)?

    public var min: CGFloat {
		get {	invocations.append(.p_min_get); return __p_min ?? givenGetterValue(.p_min_get, "SliderDataProvidingMock - stub value for min was not defined") }
		set {	invocations.append(.p_min_set(.value(newValue))); __p_min = newValue }
	}
	private var __p_min: (CGFloat)?

    public var max: CGFloat {
		get {	invocations.append(.p_max_get); return __p_max ?? givenGetterValue(.p_max_get, "SliderDataProvidingMock - stub value for max was not defined") }
		set {	invocations.append(.p_max_set(.value(newValue))); __p_max = newValue }
	}
	private var __p_max: (CGFloat)?






    fileprivate enum MethodType {
        case p_sliderValue_get
		case p_sliderValue_set(Parameter<CGFloat>)
        case p_min_get
		case p_min_set(Parameter<CGFloat>)
        case p_max_get
		case p_max_set(Parameter<CGFloat>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_sliderValue_get,.p_sliderValue_get): return true
			case (.p_sliderValue_set(let left),.p_sliderValue_set(let right)): return Parameter<CGFloat>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_min_get,.p_min_get): return true
			case (.p_min_set(let left),.p_min_set(let right)): return Parameter<CGFloat>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_max_get,.p_max_get): return true
			case (.p_max_set(let left),.p_max_set(let right)): return Parameter<CGFloat>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_sliderValue_get: return 0
			case .p_sliderValue_set(let newValue): return newValue.intValue
            case .p_min_get: return 0
			case .p_min_set(let newValue): return newValue.intValue
            case .p_max_get: return 0
			case .p_max_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func sliderValue(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_sliderValue_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func min(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_min_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func max(getter defaultValue: CGFloat...) -> PropertyStub {
            return Given(method: .p_max_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var sliderValue: Verify { return Verify(method: .p_sliderValue_get) }
		public static func sliderValue(set newValue: Parameter<CGFloat>) -> Verify { return Verify(method: .p_sliderValue_set(newValue)) }
        public static var min: Verify { return Verify(method: .p_min_get) }
		public static func min(set newValue: Parameter<CGFloat>) -> Verify { return Verify(method: .p_min_set(newValue)) }
        public static var max: Verify { return Verify(method: .p_max_get) }
		public static func max(set newValue: Parameter<CGFloat>) -> Verify { return Verify(method: .p_max_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TapGestureRecognizing
open class TapGestureRecognizingMock: NSObject, TapGestureRecognizing, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var tappedNode: BaseNode? {
		get {	invocations.append(.p_tappedNode_get); return __p_tappedNode ?? optionalGivenGetterValue(.p_tappedNode_get, "TapGestureRecognizingMock - stub value for tappedNode was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_tappedNode = newValue }
	}
	private var __p_tappedNode: (BaseNode)?

    public var state: UIGestureRecognizer.State {
		get {	invocations.append(.p_state_get); return __p_state ?? givenGetterValue(.p_state_get, "TapGestureRecognizingMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (UIGestureRecognizer.State)?






    fileprivate enum MethodType {
        case p_tappedNode_get
        case p_state_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_tappedNode_get,.p_tappedNode_get): return true
            case (.p_state_get,.p_state_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_tappedNode_get: return 0
            case .p_state_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func tappedNode(getter defaultValue: BaseNode?...) -> PropertyStub {
            return Given(method: .p_tappedNode_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func state(getter defaultValue: UIGestureRecognizer.State...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var tappedNode: Verify { return Verify(method: .p_tappedNode_get) }
        public static var state: Verify { return Verify(method: .p_state_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TapSimulating
open class TapSimulatingMock: TapSimulating, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func simulateTap() {
        addInvocation(.m_simulateTap)
		let perform = methodPerformValue(.m_simulateTap) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_simulateTap

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_simulateTap, .m_simulateTap):
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_simulateTap: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func simulateTap() -> Verify { return Verify(method: .m_simulateTap)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func simulateTap(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_simulateTap, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TimePickerDataProviding
open class TimePickerDataProvidingMock: TimePickerDataProviding, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var amPmFormat: Bool {
		get {	invocations.append(.p_amPmFormat_get); return __p_amPmFormat ?? givenGetterValue(.p_amPmFormat_get, "TimePickerDataProvidingMock - stub value for amPmFormat was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_amPmFormat = newValue }
	}
	private var __p_amPmFormat: (Bool)?

    public var timePickerValue: Date {
		get {	invocations.append(.p_timePickerValue_get); return __p_timePickerValue ?? givenGetterValue(.p_timePickerValue_get, "TimePickerDataProvidingMock - stub value for timePickerValue was not defined") }
		set {	invocations.append(.p_timePickerValue_set(.value(newValue))); __p_timePickerValue = newValue }
	}
	private var __p_timePickerValue: (Date)?





    open func timeChanged() {
        addInvocation(.m_timeChanged)
		let perform = methodPerformValue(.m_timeChanged) as? () -> Void
		perform?()
    }

    open func timeConfirmed() {
        addInvocation(.m_timeConfirmed)
		let perform = methodPerformValue(.m_timeConfirmed) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_timeChanged
        case m_timeConfirmed
        case p_amPmFormat_get
        case p_timePickerValue_get
		case p_timePickerValue_set(Parameter<Date>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_timeChanged, .m_timeChanged):
                return true 
            case (.m_timeConfirmed, .m_timeConfirmed):
                return true 
            case (.p_amPmFormat_get,.p_amPmFormat_get): return true
            case (.p_timePickerValue_get,.p_timePickerValue_get): return true
			case (.p_timePickerValue_set(let left),.p_timePickerValue_set(let right)): return Parameter<Date>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_timeChanged: return 0
            case .m_timeConfirmed: return 0
            case .p_amPmFormat_get: return 0
            case .p_timePickerValue_get: return 0
			case .p_timePickerValue_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func amPmFormat(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_amPmFormat_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func timePickerValue(getter defaultValue: Date...) -> PropertyStub {
            return Given(method: .p_timePickerValue_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func timeChanged() -> Verify { return Verify(method: .m_timeChanged)}
        public static func timeConfirmed() -> Verify { return Verify(method: .m_timeConfirmed)}
        public static var amPmFormat: Verify { return Verify(method: .p_amPmFormat_get) }
        public static var timePickerValue: Verify { return Verify(method: .p_timePickerValue_get) }
		public static func timePickerValue(set newValue: Parameter<Date>) -> Verify { return Verify(method: .p_timePickerValue_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func timeChanged(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_timeChanged, performs: perform)
        }
        public static func timeConfirmed(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_timeConfirmed, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - URLSessionDownloadingTask
open class URLSessionDownloadingTaskMock: URLSessionDownloadingTask, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func resume() {
        addInvocation(.m_resume)
		let perform = methodPerformValue(.m_resume) as? () -> Void
		perform?()
    }

    open func cancel() {
        addInvocation(.m_cancel)
		let perform = methodPerformValue(.m_cancel) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_resume
        case m_cancel

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_resume, .m_resume):
                return true 
            case (.m_cancel, .m_cancel):
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_resume: return 0
            case .m_cancel: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func resume() -> Verify { return Verify(method: .m_resume)}
        public static func cancel() -> Verify { return Verify(method: .m_cancel)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func resume(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_resume, performs: perform)
        }
        public static func cancel(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_cancel, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - URLSessioning
open class URLSessioningMock: URLSessioning, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func downloadTask_(with url: URL, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadingTask {
        addInvocation(.m_downloadTask__with_urlcompletionHandler_completionHandler(Parameter<URL>.value(`url`), Parameter<(URL?, URLResponse?, Error?) -> Void>.value(`completionHandler`)))
		let perform = methodPerformValue(.m_downloadTask__with_urlcompletionHandler_completionHandler(Parameter<URL>.value(`url`), Parameter<(URL?, URLResponse?, Error?) -> Void>.value(`completionHandler`))) as? (URL, @escaping (URL?, URLResponse?, Error?) -> Void) -> Void
		perform?(`url`, `completionHandler`)
		var __value: URLSessionDownloadingTask
		do {
		    __value = try methodReturnValue(.m_downloadTask__with_urlcompletionHandler_completionHandler(Parameter<URL>.value(`url`), Parameter<(URL?, URLResponse?, Error?) -> Void>.value(`completionHandler`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for downloadTask_(with url: URL, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void). Use given")
			Failure("Stub return value not specified for downloadTask_(with url: URL, completionHandler: @escaping (URL?, URLResponse?, Error?) -> Void). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_downloadTask__with_urlcompletionHandler_completionHandler(Parameter<URL>, Parameter<(URL?, URLResponse?, Error?) -> Void>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_downloadTask__with_urlcompletionHandler_completionHandler(let lhsUrl, let lhsCompletionhandler), .m_downloadTask__with_urlcompletionHandler_completionHandler(let rhsUrl, let rhsCompletionhandler)):
                guard Parameter.compare(lhs: lhsUrl, rhs: rhsUrl, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletionhandler, rhs: rhsCompletionhandler, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_downloadTask__with_urlcompletionHandler_completionHandler(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func downloadTask_(with url: Parameter<URL>, completionHandler: Parameter<(URL?, URLResponse?, Error?) -> Void>, willReturn: URLSessionDownloadingTask...) -> MethodStub {
            return Given(method: .m_downloadTask__with_urlcompletionHandler_completionHandler(`url`, `completionHandler`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func downloadTask_(with url: Parameter<URL>, completionHandler: Parameter<(URL?, URLResponse?, Error?) -> Void>, willProduce: (Stubber<URLSessionDownloadingTask>) -> Void) -> MethodStub {
            let willReturn: [URLSessionDownloadingTask] = []
			let given: Given = { return Given(method: .m_downloadTask__with_urlcompletionHandler_completionHandler(`url`, `completionHandler`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (URLSessionDownloadingTask).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func downloadTask_(with url: Parameter<URL>, completionHandler: Parameter<(URL?, URLResponse?, Error?) -> Void>) -> Verify { return Verify(method: .m_downloadTask__with_urlcompletionHandler_completionHandler(`url`, `completionHandler`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func downloadTask_(with url: Parameter<URL>, completionHandler: Parameter<(URL?, URLResponse?, Error?) -> Void>, perform: @escaping (URL, @escaping (URL?, URLResponse?, Error?) -> Void) -> Void) -> Perform {
            return Perform(method: .m_downloadTask__with_urlcompletionHandler_completionHandler(`url`, `completionHandler`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

