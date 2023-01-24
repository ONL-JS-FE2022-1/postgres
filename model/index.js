const { Client } = require('pg');
const User = require('./User');
const { configs } = require('../configs');

const client = new Client(configs);

User._client = configs;
User._tableName = 'users';

module.exports = {
    client,
    User
}