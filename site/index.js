import assign from 'object-assign';
export {version as mapsVersion} from '../package.json';
import {view, viewForms, viewBootstrapForms, viewReady, viewEvents} from 'd3-view';
import {visualComponents, visuals} from 'd3-visualize';

assign(visuals.options.dataContext, {
    $geoDataCode (d) {
        if (!this.filters) return;
        var country = getCountry(this.filters.country),
            v = `${country.code}-regions`;
        return d ? `${v}-${d}` : v;
    },

    $region() {
        //var country = getCountry(this.filters.country),
        //    source = this.$geoDataCode(),
        //    store = this.dataStore;
    }
});


viewReady(() => {
    appView().mount('body');
});


function appView () {
    var vm = view()
        .use(viewForms)
        .use(viewBootstrapForms)
        .use(visualComponents);

        viewEvents.on('component-mounted', (cm) => {
            if (cm.name === 'd3form') {
                cm.model.$on(() => formListener(cm));
            }
        });

    return vm;
}

function formListener () {

}

function getCountry () {

}
