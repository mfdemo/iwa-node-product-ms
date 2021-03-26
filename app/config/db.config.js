const env = process.env;

module.exports = {
  HOST: env.DB_HOST || "localhost",
  USER: env.DB_USER || 'iwa_dev',
  PASSWORD: env.DB_PASSWORD || 'iwa_dev',
  DB: env.DB_NAME || 'iwa_dev',
  dialect: "mysql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};
