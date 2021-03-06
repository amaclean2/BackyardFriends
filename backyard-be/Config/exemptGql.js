export const exemptQueries = [
    'allAdventures',
    'savePasswordReset',
    'resetPassword'
];

export const isOperation = (req, query) => {
    return req.originalUrl.includes(query);
};

export const isExempt = (req) => {
    return exemptQueries.some((query) => req.originalUrl.includes(query));
};