const DataTypes = require('sequelize/lib/data-types');

module.exports = (sequelize, Sequelize) => {
  const Product = sequelize.define("product", {
    id: {
      type: Sequelize.UUID,
      defaultValue: Sequelize.UUIDV1,
      primaryKey: true
    },
    code: {
      type: Sequelize.STRING
    },
    name: {
      type: Sequelize.STRING
    },
    summary: {
      type: Sequelize.STRING
    },
    description: {
      type: Sequelize.STRING
    },
    image: {
      type: Sequelize.STRING
    },
    price: {
      type: Sequelize.DECIMAL
    },
    onSale: {
      type: Sequelize.BOOLEAN
    },
    inStock: {
      type: Sequelize.BOOLEAN
    },
    timeToStock: {
      type: Sequelize.INTEGER
    },
    rating: {
      type: Sequelize.INTEGER
    },
    available: {
      type: Sequelize.BOOLEAN
    }
  });

  return Product;
};
