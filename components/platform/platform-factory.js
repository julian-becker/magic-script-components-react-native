// Copyright (c) 2019 Magic Leap, Inc. All Rights Reserved

import { Image, NativeEventEmitter, NativeModules, processColor } from 'react-native';
import { NativeFactory } from '../core/native-factory';
import generateId from '../lib/generateId';
import omit from 'lodash/omit';
import isEqual from 'lodash/isEqual';

export class PlatformFactory extends NativeFactory {
    constructor(componentMapping) {
        super(componentMapping);

        // { type, builder }
        this.elementBuilders = {};
        // this.controllerBuilders = {};
        // this.controllers = new WeakMap();
        this.componentManager = NativeModules.ARComponentManager;
        this.componentManager.clearScene();
        this.setupEventsManager();
    }

    setupEventsManager() {
        this.eventsByElementId = {};

        this.eventsManager = new NativeEventEmitter(NativeModules.AREventsManager);
        this.startListeningEvent('onPress');
        this.startListeningEvent('onClick');
    }

    startListeningEvent(eventName) {
        const subscription = this.eventsManager.addListener(eventName, (sender) => {
            const elementId = sender.nodeId;
            const events = this.eventsByElementId[elementId];
            if (events !== undefined) {
                const onPressEvents = events.filter(item => item.name === eventName);
                onPressEvents.forEach(item => {
                    console.log(`[EVENTS] ${eventName} received: ${elementId}\nitem: `, item);
                    item.handler();
                });
            }
        });
        // Don't forget to unsubscribe, typically in componentWillUnmount
        // subscription.remove();
    }

    registerEvent(elementId, name, handler) {
        if (elementId === undefined) { return; }

        this.componentManager.addOnPressEventHandler(elementId);

        const pair = { name, handler };
        var events = this.eventsByElementId[elementId];
        if (events === undefined) {
            events = [pair];
            this.eventsByElementId[elementId] = events;
            console.log(`[EVENTS] "${elementId}" register first ${name} event (${this.eventsByElementId[elementId].length}).`);
        } else {
            events.push(pair);
            console.log(`[EVENTS] "${elementId}" register another ${name} event (${this.eventsByElementId[elementId].length}).`);
        }
    }

    isController(element) {
        return this.controllers[element] !== undefined;
    }

    setComponentEvents(elementId, properties) {
        const eventHandlers = Object.keys(properties)
            .filter(key => key.length > 2 && key.startsWith('on'))
            .map(key => ({ name: key, handler: properties[key] }));

        for (const pair of eventHandlers) {
            const eventName = pair.name;//UiNodeEvents[pair.name];

            if (eventName !== undefined) {
                if (typeof pair.handler === 'function') {
                    this.registerEvent(elementId, pair.name, pair.handler);
                    // element[eventName](pair.handler);
                } else {
                    throw new TypeError(`The event handler for ${pair.name} is not a function`);
                }
            } else {
                throw new TypeError(`Event ${pair.name} is not recognized event`);
            }
        }
    }

    createElement(name, container, ...args) {
        if (typeof name !== 'string') {
            throw new Error('PlatformFactory.createElement expects "name" to be string');
        }

        if (this._mapping.elements[name] !== undefined) {
            return this._createElement(name, container, ...args)
        } else {
            throw new Error(`Unknown tag: ${name}`);
        }
    }

    _processCustomProps = (props) => {
        const properties = omit(props, 'children');
        return ({
            ...properties,
            ...(properties.shadowColor ? { shadowColor: processColor(properties.shadowColor) } : {}),
            ...(properties.color ? { color: processColor(properties.color) } : {}),
            ...(properties.textColor ? { textColor: processColor(properties.textColor) } : {}),
            // ...(properties.material ? { material: processMaterial(properties.material) } : {}),
            ...(properties.source ? { source: Image.resolveAssetSource(properties.source) } : {}),
        });
    }

    _createElement(name, container, ...args) {
        if (this.elementBuilders[name] === undefined) {
            const createBuilder = this._mapping.elements[name];
            this.elementBuilders[name] = createBuilder(this.componentManager);
        }

        const props = this._processCustomProps(args[0]);
        const id = props.id || generateId();

        this.elementBuilders[name].create(props, id);
        this.setComponentEvents(id, props);

        return { name, id, props };
    }

    updateElement(name, ...args) {
        if (typeof name !== 'string') {
            throw new Error('PlatformFactory.updateElement expects "name" to be string');
        }
        
        if (this._mapping.elements[name] !== undefined) {
            const oldProps = this._processCustomProps(args[1]);
            const newProps = this._processCustomProps(args[2]);
            if (!isEqual(oldProps, newProps)) {
                const element = args[0];
                this.componentManager.updateNode(element.id, newProps);
            }
        } else {
            throw new Error(`Unknown tag: ${name}`);
        }
    }

    insertBefore(parent, child, beforeChild) {
        if (typeof child === 'string' || typeof child === 'number') {
            const props = (parent.name === 'button') ? { title: child.toString() } : { text: child.toString() };
            this.componentManager.updateNode(parent.id, props);
        } else {
            this.componentManager.addChildNode(child.id, parent.id);
        }
    }

    addChildElement(parent, child) {
        if (typeof child === 'string' || typeof child === 'number') {
            const props = (parent.name === 'button') ? { title: child.toString() } : { text: child.toString() };
            this.componentManager.updateNode(parent.id, props);
        } else {
            this.componentManager.addChildNode(child.id, parent.id);
        }
    }

    removeChildElement(parent, child) {
        if (typeof child === 'string' || typeof child === 'number') {
            const props = (parent.name === 'button') ? { title: '' } : { text: '' };
            this.componentManager.updateNode(parent.id, props);
        } else {
            this.componentManager.removeChildNode(child.id, parent.id);
        }
    }

    appendChildToContainer(container, child) {
        this.componentManager.addChildNodeToContainer(child.id);
    }

    removeChildFromContainer(container, child) {
        this.componentManager.removeChildNodeFromRoot(child.id);
    }

    createApp(appComponent) {
    }
}