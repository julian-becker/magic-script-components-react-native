import ThreeRenderer from './three-renderer';

const ThreeScript = {    
  render: (element, container, callback) => {
    console.log('[MSX] render.element: ', element);

    if (!container.__rootContainer) {
        container.__rootContainer = ThreeRenderer.createContainer(container);
    }

    console.log('[MSX] render.container: ', container);

    try {
        ThreeRenderer.updateContainer(element, container.__rootContainer, null, callback);
        console.log('[MSX] render.updateContainer: ', container.__rootContainer);
    } catch (error) {
        console.log('[MSX] render.updateContainer.error ', error);
    }

    return container;
  }
};

export default ThreeScript;
