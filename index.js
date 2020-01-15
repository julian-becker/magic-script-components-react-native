import ARView from "./ARView";
import ReactNativeMagicScript from "./components/react-native-magic-script/react-native-magic-script";
import ModuleBuilder from './components/core/module-builder.js';

// backward compatibility, should be removed in the future
const ARKitScript = ReactNativeMagicScript;

export { ARView, ARKitScript, ReactNativeMagicScript, ModuleBuilder };