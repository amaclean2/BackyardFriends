const { userResolvers } = require('./User');
const { adventureResolvers } = require('./Adventure');
const { activityResolvers } = require('./Activity');
const { tickResolvers } = require('./Tick');
const { pictureResolvers } = require('./Pictures');


const resolvers = {
    Query: {
        ...userResolvers?.Query,
        ...adventureResolvers?.Query,
        ...activityResolvers?.Query,
        ...tickResolvers?.Query
    },
    Mutation: {
        ...userResolvers?.Mutation,
        ...adventureResolvers?.Mutation,
        ...activityResolvers?.Mutation,
        ...tickResolvers?.Mutation,
        ...pictureResolvers?.Mutation
    },
    Upload: {
        ...pictureResolvers?.Upload
    }
};

module.exports = resolvers;