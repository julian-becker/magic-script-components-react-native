import nativeComponentMapping from './platform/component-mapping.js';
import { PlatformFactory } from './platform/platform-factory';

export default {
    _nativeFactory: new PlatformFactory(nativeComponentMapping),
};
