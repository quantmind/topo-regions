import json from 'rollup-plugin-json';
import babel from 'rollup-plugin-babel';
import commonjs from 'rollup-plugin-commonjs';
import node from 'rollup-plugin-node-resolve';
import sourcemaps from 'rollup-plugin-sourcemaps';


export default {
    input: 'site/index.js',
    //input: 'src/index-dev.js',
    output: {
        file: 'website/assets/site.js',
        format: 'umd',
        sourcemap: true,
        extend: true,
        name: 'd3'
    },
    plugins: [
        json(),
        babel({
            babelrc: false,
            runtimeHelpers: true,
            presets: ['es2015-rollup']
        }),
        commonjs({
            include: [
                'node_modules/**',
                // required for d3-visualize with link
                '../d3-visualize/node_modules/**'
            ]
        }),
        sourcemaps(),
        node()
    ]
};
