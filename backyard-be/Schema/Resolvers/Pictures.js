const GraphQLUpload = require('graphql-upload/GraphQLUpload.mjs');
const { finished } = require('stream/promises');

const pictureResolvers = {
    Upload: GraphQLUpload,
    Mutation: {
        singleUpload: async (parent, args) => {
            const { file } = args;
            const { createReadStream, filename, mimetype, encoding } = await file;

            const stream = createReadStream();

            const out = require('fs').createWriteStream('local-file-output.txt');
            stream.pipe(out);
            await finished(out);

            return { filename, mimetype, encoding };
        }
    }
};

module.exports = {
    pictureResolvers
};