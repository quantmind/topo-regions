export {version as mapsVersion} from '../package.json';
import {map} from 'd3-collection';
import {view, viewProviders, viewForms, viewBootstrapForms, viewReady, viewEvents} from 'd3-view';
import {visualComponents} from 'd3-visualize';

function appView () {
    var vm = view()
        .use(viewForms)
        .use(viewBootstrapForms)
        .use(visualComponents)
        .use(components);
    return vm;
}


export const app = appView();


viewReady(() => {
    app.mount('body');
});
