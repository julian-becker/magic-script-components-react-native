package com.reactlibrary;

import android.os.Handler;
import android.os.Looper;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.google.ar.sceneform.Node;
import com.reactlibrary.scene.UiNodesManager;
import com.reactlibrary.scene.nodes.GroupNode;
import com.reactlibrary.scene.nodes.ModelNode;
import com.reactlibrary.scene.nodes.UiButtonNode;
import com.reactlibrary.scene.nodes.UiImageNode;
import com.reactlibrary.scene.nodes.UiSpinnerNode;
import com.reactlibrary.scene.nodes.UiTextEditNode;
import com.reactlibrary.scene.nodes.UiTextNode;
import com.reactlibrary.scene.nodes.UiToggleNode;
import com.reactlibrary.scene.nodes.base.TransformNode;
import com.reactlibrary.scene.nodes.base.UiNode;
import com.reactlibrary.scene.nodes.layouts.UiGridLayout;
import com.reactlibrary.scene.nodes.video.MediaPlayerPool;
import com.reactlibrary.scene.nodes.video.UiVideoNode;

import java.util.Collections;
import java.util.Map;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/**
 * Android module that is responsible for "parsing" JS tags in order to generate AR Nodes
 * Based on: https://facebook.github.io/react-native/docs/native-modules-android
 * <p>
 * Node creation methods are called from
 * react-native-magic-script/components/platform/platform-factory.js
 */
public class ARComponentManager extends ReactContextBaseJavaModule implements LifecycleEventListener {

    // Supported events names
    private static final String EVENT_CLICK = "onClick";
    private static final String EVENT_PRESS = "onPress";
    private static final String EVENT_TEXT_CHANGED = "onTextChanged";
    private static final String EVENT_TOGGLE_CHANGED = "onToggleChanged";

    // Supported events arguments
    private static final String EVENT_ARG_NODE_ID = "nodeId";
    private static final String EVENT_ARG_TEXT = "text";
    private static final String EVENT_ARG_TOGGLE_ACTIVE = "on";

    // All code inside react method must be called from main thread
    private Handler mainHandler = new Handler(Looper.getMainLooper());

    private ReactApplicationContext context;

    public ARComponentManager(ReactApplicationContext reactContext) {
        super(reactContext);
        // here activity is null yet (so we use initAR method)
        this.context = reactContext;
        context.addLifecycleEventListener(this);
    }

    @Override
    public String getName() {
        return "ARComponentManager";
    }

    @Override
    public Map<String, Object> getConstants() {
        return Collections.emptyMap();
    }

    /**
     * Must be called before adding AR View
     */
    @ReactMethod
    public void initAR() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                AppCompatActivity activity = (AppCompatActivity) getCurrentActivity();
                ArViewManager.initActivity(activity);
            }
        });
    }

    /**
     * Creates node that is a parent for other nodes
     * (it does not contain a view)
     *
     * @param props  properties (e.g. localPosition)
     * @param nodeId id of the node
     */
    @ReactMethod
    public void createGroupNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new GroupNode(props), nodeId);
            }
        });
    }

    @ReactMethod
    public void createViewNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new GroupNode(props), nodeId);
            }
        });
    }

    /**
     * Creates a button
     *
     * @param props  properties (e.g. localPosition)
     * @param nodeId id of the node
     */
    @ReactMethod
    public void createButtonNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new UiButtonNode(props, context), nodeId);
            }
        });
    }

    @ReactMethod
    public void createImageNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new UiImageNode(props, context), nodeId);
            }
        });
    }

    @ReactMethod
    public void createTextNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new UiTextNode(props, context), nodeId);
            }
        });
    }

    @ReactMethod
    public void createTextEditNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new UiTextEditNode(props, context), nodeId);
            }
        });
    }

    @ReactMethod
    public void createModelNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new ModelNode(props, context), nodeId);
            }
        });
    }

    @ReactMethod
    public void createVideoNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new UiVideoNode(props, context), nodeId);
            }
        });
    }

    @ReactMethod
    public void createSpinnerNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new UiSpinnerNode(props, context), nodeId);
            }
        });
    }

    @ReactMethod
    public void createToggleNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new UiToggleNode(props, context), nodeId);
            }
        });
    }

    @ReactMethod
    public void createProgressBarNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                // TODO
            }
        });
    }

    @ReactMethod
    public void createLineNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                // TODO
            }
        });
    }

    @ReactMethod
    public void createGridLayoutNode(final ReadableMap props, final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                addNode(new UiGridLayout(props), nodeId);
            }
        });
    }

    @ReactMethod
    public void addChildNode(final String nodeId, final String parentId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                UiNodesManager.addNodeToParent(nodeId, parentId);
            }
        });
    }

    @ReactMethod
    public void addChildNodeToContainer(final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                UiNodesManager.addNodeToRoot(nodeId);
            }
        });
    }

    @ReactMethod
    public void removeChildNode(final String nodeId, final String parentId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                UiNodesManager.removeNode(nodeId);
            }
        });
    }

    @ReactMethod
    public void removeChildNodeFromRoot(final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                UiNodesManager.removeNode(nodeId);
            }
        });
    }

    @ReactMethod
    public void updateNode(final String nodeId, final ReadableMap properties) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                UiNodesManager.updateNode(nodeId, properties);
            }
        });
    }

    @ReactMethod
    public void clearScene() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                UiNodesManager.clear();
            }
        });
    }

    @ReactMethod
    public void validateScene() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                UiNodesManager.validateScene();
            }
        });
    }

    @ReactMethod
    public void addOnPressEventHandler(final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                final Node node = UiNodesManager.findNodeWithId(nodeId);
                if (node instanceof UiNode) {
                    ((UiNode) node).setClickListener(new Function0<Unit>() {
                        @Override
                        public Unit invoke() {
                            WritableMap pressParams = Arguments.createMap();
                            pressParams.putString(EVENT_ARG_NODE_ID, nodeId);

                            // must use separate map
                            WritableMap clickParams = Arguments.createMap();
                            clickParams.putString(EVENT_ARG_NODE_ID, nodeId);

                            sendEvent(EVENT_PRESS, pressParams);
                            sendEvent(EVENT_CLICK, clickParams);
                            return Unit.INSTANCE;
                        }
                    });
                }
            }
        });
    }

    @ReactMethod
    public void removeOnPressEventHandler(final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                Node node = UiNodesManager.findNodeWithId(nodeId);
                if (node instanceof UiNode) {
                    ((UiNode) node).setClickListener(null);
                }
            }
        });
    }

    @ReactMethod
    public void addOnTextChangedEventHandler(final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                final Node node = UiNodesManager.findNodeWithId(nodeId);
                if (node instanceof UiTextEditNode) {
                    ((UiTextEditNode) node).setTextChangedListener(new Function1<String, Unit>() {
                        @Override
                        public Unit invoke(String text) {
                            WritableMap params = Arguments.createMap();
                            params.putString(EVENT_ARG_NODE_ID, nodeId);
                            params.putString(EVENT_ARG_TEXT, text);

                            sendEvent(EVENT_TEXT_CHANGED, params);
                            return Unit.INSTANCE;
                        }
                    });
                }
            }
        });
    }

    @ReactMethod
    public void addOnToggleChangedEventHandler(final String nodeId) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                final Node node = UiNodesManager.findNodeWithId(nodeId);
                if (node instanceof UiToggleNode) {
                    ((UiToggleNode) node).setToggleChangedListener(new Function1<Boolean, Unit>() {
                        @Override
                        public Unit invoke(Boolean isOn) {
                            WritableMap params = Arguments.createMap();
                            params.putString(EVENT_ARG_NODE_ID, nodeId);
                            params.putBoolean(EVENT_ARG_TOGGLE_ACTIVE, isOn);

                            sendEvent(EVENT_TOGGLE_CHANGED, params);
                            return Unit.INSTANCE;
                        }
                    });
                }
            }
        });
    }

    @ReactMethod
    public void updateLayout() {
        // unused on Android
    }

    private void addNode(TransformNode node, String nodeId) {
        node.build();
        UiNodesManager.registerNode(node, nodeId);
    }

    private void sendEvent(String eventName, @Nullable WritableMap params) {
        context.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit(eventName, params);
    }

    @Override
    public void onHostResume() {

    }

    @Override
    public void onHostPause() {

    }

    @Override
    public void onHostDestroy() {
        Log.d("ARComponentManager", "onHostDestroy");
        MediaPlayerPool.INSTANCE.destroy();
    }
}
