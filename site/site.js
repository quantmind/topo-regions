const fs = require('fs');
const logger = require('console');
const Handlebars = require('handlebars');

const templateFile = 'site/index.html.tpl';
const pagesPath = 'site/pages/';


function capFirst (text) {
    return text.substring(0, 1).toUpperCase() + text.substring(1);
}

// read template
fs.readFile('package.json', 'utf8', (err, source) => {
    if (err) {
        return logger.error('Failed to read package.json');
    }
    const doc = JSON.parse(source);
    const version = doc['version'].split('.').join('_');

    fs.readFile(templateFile, 'utf8', (err, source) => {
        if (err) {
            return logger.error(`Failed to read template: ${templateFile}`);
        }
        const template = Handlebars.compile(source);

        // read pages
        fs.readdir(pagesPath, (err, pages) => {

            pages.forEach(page => {
                var title = page === 'index.html' ? 'Overview' : capFirst(page.split('.')[0]);

                var outFile = `website/${page}`,
                    contents = template({
                        version: version,
                        title: doc['title'] + ' ' + title
                    });

                fs.writeFile(outFile, contents, err => {
                    if (err) {
                        logger.error(`Failed to write ${outFile}: ${err}`);
                    } else {
                        logger.info(`Created ${outFile}`);
                    }
                });
            });

        });

    });

});
