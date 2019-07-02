'use strict';

const Hapi = require('@hapi/hapi');

const server = Hapi.server({
    port: process.env.port || 1337,
    host: '0.0.0.0'
});

server.route({
    method: 'GET',
    path: '/',
    handler: (request, h) => {

        return 'Hello, world!';
    }
});

server.route({
    method: 'GET',
    path: '/{name}',
    handler: (request, h) => {

        return 'Hello, ' + decodeURIComponent(request.params.name) + '!';
    }
});

const init = async () => {
    await server.register([{
        plugin: require('hapi-graceful-shutdown-plugin'),
        options: {
            sigtermTimeout: 1,
            sigintTimeout: 1
        }
    }]);
    await server.start();
    console.log(`Server running at: ${server.info.uri}`);
};

process.on('unhandledRejection', (err) => {

    console.log(err);
    process.exit(1);
});

init();
