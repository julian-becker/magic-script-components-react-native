const Reconciler = require('react-reconciler');
import ReactReconciler from 'react-reconciler';
import mxs from './msx';

// Flow type definitions ------------------------------------------------------
//  Type = string;
//  Props = Object;
//  Container = number;
//  Instance = {
//     _children: Array<Instance | number>,
//    _nativeTag: number,
//    viewConfig: ReactNativeBaseComponentViewConfig<>,
//  };
//  TextInstance = number;
//  HydratableInstance = Instance | TextInstance;
//  PublicInstance = Instance;
//  HostContext = $ReadOnly<{| isInAParentText: boolean,|}>;
//  TimeoutHandle = TimeoutID;
//  NoTimeout = -1;

const NO_CONTEXT = {};
const UPDATE_SIGNAL = {};

// Host Config Interface ------------------------------------------------------

// Function: createInstance
// Description: This is where react-reconciler wants to create an instance of UI element in terms of the target.
// Returns: Instance
// Input parameters: 
//  type: string,
//  props: Props,
//  rootContainerInstance: Container,
//  hostContext: HostContext,
//  internalInstanceHandle: Object
function createInstance(type, props, rootContainerInstance, hostContext, internalInstanceHandle) {
  console.log(`[MXS] createInstance ${type}`);
  // console.log(props);
  // console.log(rootContainerInstance);
  // console.log(hostContext);
  // console.log(internalInstanceHandle);
  return mxs._nativeFactory.createElement(type, rootContainerInstance, props);
}

// Function: This function is used to create separate text nodes if the target allows only creating text in separate text nodes
// Description: 
// Returns: TextInstance
// Input parameters:
//  text: string,
//  rootContainerInstance: Container,
//  hostContext: HostContext,
//  internalInstanceHandle: Object
function createTextInstance(text, rootContainerInstance, hostContext, internalInstanceHandle) {
  console.log(`[MXS] createTextInstance ${text}`);
  return text;
}

// Function: appendInitialChild
// Description: This function gets called for initial UI tree creation
// Returns: void
// Input paramters: 
//  parentInstance: Instance,
//  child: Instance | TextInstance
function appendInitialChild(parentInstance, child) {
  console.log('[MXS] appendInitialChild');
  // console.log(parentInstance);
  // console.log(child);
  mxs._nativeFactory.addChildElement(parentInstance, child);
}

// Function: finalizeInitialChildren
// Description:
// Returns: boolean
// Input parameters:
//  parentInstance: Instance,
//  type: string,
//  props: Props,
//  rootContainerInstance: Container,
//  hostContext: HostContext
function finalizeInitialChildren(parentInstance, type, props, rootContainerInstance, hostContext) {
  console.log('[MXS] finalizeInitialChildren');
  return false;
}

// Function: getRootHostContext
// Description:
// Returns: HostContext
// Input parameters:
//  rootContainerInstance: Container
function getRootHostContext(rootContainerInstance) {
  console.log('[MXS] getRootHostContext');

  // React-360
  // return {};

  // react-native-renderer
  return {isInAParentText: false};
}

// Function: getChildHostContext
// Description:
// Returns: HostContext
// Input parameters:
//  parentHostContext: HostContext,
//  type: string,
//  rootContainerInstance: Container
function getChildHostContext(parentHostContext, type, rootContainerInstance) {
  console.log('[MXS] getChildHostContext');
  // React-360
  // return {};

  const isInAParentText = type === 'RCTText' ||  type === 'RCTVirtualText';
  return (isInAParentText !== parentHostContext.isInAParentText) ? { isInAParentText } : parentHostContext;
}

// Function: getPublicInstance
// Description:s
// Returns: Instance
// Input parameters:
//  instance: Instance
function getPublicInstance(instance) {
  console.log('[MXS] getPublicInstance');
  return instance;
}

// Function: prepareForCommit
// Description:
// Returns: void
// Input parameters:
//  containerInfo: Container
function prepareForCommit(containerInfo) {
  console.log('[MXS] prepareForCommit');
}

// Function: resetAfterCommit
// Description:
// Returns: void
// Input parameters:
//  containerInfo: Container
function resetAfterCommit(containerInfo) {
  console.log('[MXS] resetAfterCommit');
}

// Function: prepareUpdate
// Description: This is where we would want to diff between oldProps and newProps and decide whether to update or not
// Returns: null | Object
// Input parameters:
//  instance: Instance,
//  type: string,
//  oldProps: Props,
//  newProps: Props,
//  rootContainerInstance: Container,
//  hostContext: HostContext
function prepareUpdate(instance, type, oldProps, newProps, rootContainerInstance, hostContext) {
  console.log('[MXS] prepareUpdate');
  return true;
}

// Function: shouldDeprioritizeSubtree
// Description: 
// Returns: boolean
// Input parameters:
//  type: string, 
//  props: Props
function shouldDeprioritizeSubtree(type, props) {
  logNotImplemented('shouldDeprioritizeSubtree');
  // return false
}

// Function: shouldSetTextContent
// Description: 
// Returns: boolean
// Input parameters:
//  type: string, 
//  props: Props
function shouldSetTextContent(type, props) {
  // Brian Vaughn:
  //  Always returning false simplifies the createInstance() implementation,
  //  But creates an additional child Fiber for raw text children.
  //  No additional native views are created though.
  console.log('[MXS] shouldSetTextContent');
  // console.log(type);
  // console.log(props);

  return false;
}

// Function: appendChild
// Description: 
// Returns: void
// Input parameters:
//  parentInstance: Instance,
//  child: Instance | TextInstance
function appendChild(parentInstance, child) {
  console.log('[MXS] appendChild');
  // console.log(parentInstance);
  // console.log(child);
  mxs._nativeFactory.addChildElement(parentInstance, child);
}

// Function: appendChildToContainer
// Description: 
// Returns: void
// Input parameters:
//  parentInstance: Instance,
//  child: Instance | TextInstance
function appendChildToContainer(container, child) {
  console.log('[MXS] appendChildToContainer');
  // console.log(container);
  // console.log(child);
  mxs._nativeFactory.appendChildToContainer(container, child);
}

// Function: commitTextUpdate
// Description: 
// Returns: void
// Input parameters:
//  textInstance: TextInstance,
//  oldText: string,
//  newText: string
function commitTextUpdate(textInstance, oldText, newText) {
  logNotImplemented('commitTextUpdate');
  // console.log(textInstance);
  // console.log(oldText);
  // console.log(newText);
}

// Function: commitMount
// Description: 
// Returns: void
// Input parameters:
//  instance: Instance,
//  type: string,
//  newProps: Props,
//  internalInstanceHandle: Object
function commitMount(instance, type, newProps, internalInstanceHandle) {
  logNotImplemented('commitMount');
}

// Function: commitUpdate
// Description: 
// Returns: void
// Input parameters:
//  instance: Instance,
//  updatePayload: Object,
//  type: string,
//  oldProps: Props,
//  newProps: Props,
//  internalInstanceHandle: Object
function commitUpdate(instance, updatePayload, type, oldProps, newProps, internalInstanceHandle) {
  console.log('[MXS] commitUpdate');
  // console.log(instance);
  // console.log(type);
  // console.log(updatePayload);
  // console.log(oldProps);
  // console.log(newProps);
  mxs._nativeFactory.updateElement(type, instance, oldProps, newProps);
}

// Function: insertBefore
// Description: 
// Returns: void
// Input parameters:
//  parentInstance: Instance,
//  child: Instance | TextInstance,
//  beforeChild: Instance | TextInstance
function insertBefore(parentInstance, child, beforeChild) {
  mxs._nativeFactory.insertBefore(parentInstance, child, beforeChild);
}

// Function: insertInContainerBefore
// Description: 
// Returns: void
// Input parameters:
//  parentInstance: Container,
//  child: Instance | TextInstance,
//  beforeChild: Instance | TextInstance
function insertInContainerBefore(container, child, beforeChild) {
  logNotImplemented('insertInContainerBefore');
}

// Function: removeChild
// Description: 
// Returns: void
// Input parameters:
//  parentInstance: Instance,
//  child: Instance | TextInstance
function removeChild(parentInstance, child) {
  console.log('[MXS] removeChild');
  mxs._nativeFactory.removeChildElement(parentInstance, child);
}

// Function: removeChildFromContainer
// Description: 
// Returns: void
// Input parameters:
//  parentInstance: Container,
//  child: Instance | TextInstance
function removeChildFromContainer(parentInstance, child) {
  console.log('[MXS] removeChildFromContainer');
  // console.log(parentInstance);
  // console.log(child);
  mxs._nativeFactory.removeChildFromContainer(parentInstance, child);
}

// Function: resetTextContent
// Description: 
// Returns: void
// Input parameters:
//  instance: Instance
function resetTextContent(instance) {
  logNotImplemented('resetTextContent');
}

// Function: hideInstance
// Description: 
// Returns: void
// Input parameters:
//  instance: Instance
function hideInstance(instance) {
  logNotImplemented('hideInstance');
}

// Function: hideTextInstance
// Description: 
// Returns: void
// Input parameters:
//  textInstance: TextInstance
function hideTextInstance(textInstance) {
  logNotImplemented('hideTextInstance');
}

// Function: unhideInstance
// Description: 
// Returns: void
// Input parameters:
//  instance: Instance,
//  props: Props
function unhideInstance(instance, props) {
  logNotImplemented('unhideInstance');
}

// Function: unhideTextInstance
// Description: 
// Returns: void
// Input parameters:
//  textInstance: TextInstance,
//  text: string
function unhideTextInstance(textInstance, text) {
  logNotImplemented('unhideTextInstance');
}


const HostConfig = {
  now: Date.now,
  
  createInstance: createInstance,
  createTextInstance: createTextInstance,

  appendInitialChild: appendInitialChild,
  finalizeInitialChildren: finalizeInitialChildren,

  getPublicInstance: getPublicInstance,
  getRootHostContext: getRootHostContext,
  getChildHostContext: getChildHostContext,
  
  prepareForCommit: prepareForCommit,
  resetAfterCommit: resetAfterCommit,

  prepareUpdate: prepareUpdate,

  shouldDeprioritizeSubtree: shouldDeprioritizeSubtree,
  shouldSetTextContent: shouldSetTextContent,

  isPrimaryRenderer: true,
  noTimeout: -1,
  scheduleTimeout: throwNotImplemented('scheduleTimeout'),
  cancelTimeout: throwNotImplemented('cancelTimeout'),

  supportsMutation: true, 
  supportsPersistence: false,
  supportsHydration: false,
  
  
  // Mutation -----------------------------------------------------------------

  appendChild: appendChild,
  appendChildToContainer: appendChildToContainer,
  commitTextUpdate: commitTextUpdate,
  commitMount: commitMount,
  commitUpdate: commitUpdate,
  insertBefore: insertBefore,
  insertInContainerBefore: insertInContainerBefore,
  removeChild: removeChild,
  removeChildFromContainer: removeChildFromContainer,
  resetTextContent: resetTextContent,
  hideInstance: hideInstance,
  hideTextInstance: hideTextInstance,
  unhideInstance: unhideInstance,
  unhideTextInstance: unhideTextInstance,

  
  // Persistence --------------------------------------------------------------
  
  cloneInstance: throwNotImplemented('cloneInstance'),
  createContainerChildSet: throwNotImplemented('createContainerChildSet'),
  appendChildToContainerChildSet: throwNotImplemented('appendChildToContainerChildSet'),
  finalizeContainerChildren: throwNotImplemented('finalizeContainerChildren'),
  replaceContainerChildren: throwNotImplemented('replaceContainerChildren'),
  cloneHiddenInstance: throwNotImplemented('cloneHiddenInstance'),
  cloneUnhiddenInstance: throwNotImplemented('cloneUnhiddenInstance'),
  createHiddenTextInstance: throwNotImplemented('createHiddenTextInstance'),

  
  // Hydration ----------------------------------------------------------------
  
  canHydrateInstance: throwNotImplemented('canHydrateInstance'),
  canHydrateTextInstance: throwNotImplemented('canHydrateTextInstance'),
  canHydrateSuspenseInstance: throwNotImplemented('canHydrateSuspenseInstance'),
  isSuspenseInstancePending: throwNotImplemented('isSuspenseInstancePending'),
  isSuspenseInstanceFallback: throwNotImplemented('isSuspenseInstanceFallback'),
  registerSuspenseInstanceRetry: throwNotImplemented('registerSuspenseInstanceRetry'),
  getNextHydratableSibling: throwNotImplemented('getNextHydratableSibling'),
  getFirstHydratableChild: throwNotImplemented('getFirstHydratableChild'),
  hydrateInstance: throwNotImplemented('hydrateInstance'),
  hydrateTextInstance: throwNotImplemented('hydrateTextInstance'),
  getNextHydratableInstanceAfterSuspenseInstance: throwNotImplemented('getNextHydratableInstanceAfterSuspenseInstance'),
  clearSuspenseBoundary: throwNotImplemented('clearSuspenseBoundary'),
  clearSuspenseBoundaryFromContainer: throwNotImplemented('clearSuspenseBoundaryFromContainer'),
  didNotMatchHydratedContainerTextInstance: throwNotImplemented('didNotMatchHydratedContainerTextInstance'),
  didNotMatchHydratedTextInstance: throwNotImplemented('didNotMatchHydratedTextInstance'),
  didNotHydrateContainerInstance: throwNotImplemented('didNotHydrateContainerInstance'),
  didNotHydrateInstance: throwNotImplemented('didNotHydrateInstance'),
  didNotFindHydratableContainerInstance: throwNotImplemented('didNotFindHydratableContainerInstance'),
  didNotFindHydratableContainerTextInstance: throwNotImplemented('didNotFindHydratableContainerTextInstance'),
  didNotFindHydratableContainerSuspenseInstance: throwNotImplemented('didNotFindHydratableContainerSuspenseInstance'),
  didNotFindHydratableInstance: throwNotImplemented('didNotFindHydratableInstance'),
  didNotFindHydratableTextInstance: throwNotImplemented('didNotFindHydratableTextInstance'),
  didNotFindHydratableSuspenseInstance: throwNotImplemented('didNotFindHydratableSuspenseInstance')
};

function logNotImplemented(functionName) {
  const message = `[MXS] ${functionName} has not been implemented yet`;

  console.log(message);
  print(message);
}

function throwNotImplemented(functionName) {
  return () => {
    throw new Error(`[MXS] ${functionName} has not been implemented yet`);
  };
}

const ARKitRenderer = ReactReconciler(HostConfig);
export default ARKitRenderer;

const HostConfig = {
  now: Date.now,
  isPrimaryRenderer: false,
  getPublicInstance: function(instance) {
    return instance;
  },
  getRootHostContext: function(nextRootInstance) {
    let rootContext = {};
    return rootContext;
  },
  getChildHostContext: function(parentContext, fiberType, rootInstance) {
    let context = { type: fiberType };
    return context;
  },
  shouldSetTextContent: function(type, nextProps) {
    return false;
  },
  createTextInstance: function(
    newText,
    rootContainerInstance,
    currentHostContext,
    workInProgress
  ) {
    return document.createTextNode(newText);
  },
  createInstance: function(
    type,
    newProps,
    rootContainerInstance,
    currentHostContext,
    workInProgress
  ) {
    console.log('[CustomRenderer] createInstance called..');
    const element = document.createElement(type);
    element.className = newProps.className || "";
    element.style = newProps.style;
    // ....
    // ....
    if (newProps.onClick) {
      element.addEventListener("click", newProps.onClick);
    }
    return element;
  },
  appendInitialChild: (parent, child) => {
    parent.appendChild(child);
  },
  finalizeInitialChildren: (
    instance,
    type,
    newProps,
    rootContainerInstance,
    currentHostContext
  ) => {
    return newProps.autofocus; //simply return true for experimenting
  },
  prepareForCommit: function(rootContainerInstance) {},
  resetAfterCommit: function(rootContainerInstance) {},
  commitMount: (domElement, type, newProps, fiberNode) => {
    domElement.focus();
  },
  appendChildToContainer: (parent, child) => {
    parent.appendChild(child);
  },
  supportsMutation: true,
  prepareUpdate: function(
    instance,
    type,
    oldProps,
    newProps,
    rootContainerInstance,
    currentHostContext
  ) {
    return; //return nothing.
  },
  commitUpdate: function(
    instance,
    updatePayload,
    type,
    oldProps,
    newProps,
    finishedWork
  ) {
    return; //return nothing.
  },
  commitTextUpdate: function(textInstance, oldText, newText) {
    textInstance.nodeValue = newText;
  },
  appendChild: function(parentInstance, child) {
    parentInstance.appendChild(child);
  },
  insertBefore: (parentInstance, child, beforeChild) => {
    parentInstance.insertBefore(child, beforeChild);
  },
  removeChild: function(parentInstance, child) {
    parentInstance.removeChild(child);
  },
  insertInContainerBefore: function(container, child, beforeChild) {
    container.insertBefore(child, beforeChild);
  },
  removeChildFromContainer: function(container, child) {
    container.removeChild(child);
  },
  resetTextContent: function(domElement) {},
  shouldDeprioritizeSubtree: function(type, nextProps) {
    return !!nextProps.hidden;
  }
};

const reconcilerInstance = Reconciler(HostConfig);

const ThreeRender = {
  render(element, renderDom, callback) {
    // element: This is the react element for App component
    // renderDom: This is the host root element to which the rendered app will be attached.
    // callback: if specified will be called after render is done.

    const isAsync = false; // Disables async rendering
    const container = reconcilerInstance.createContainer(renderDom, isAsync); // Creates root fiber node.

    const parentComponent = null; // Since there is no parent (since this is the root fiber). We set parentComponent to null.
    reconcilerInstance.updateContainer(
      element,
      container,
      parentComponent,
      callback
    ); // Start reconcilation and render the result
  }
};

module.exports = ThreeRender;
