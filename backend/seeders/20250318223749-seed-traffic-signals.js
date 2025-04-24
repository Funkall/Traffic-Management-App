'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('traffic_signals', [
      {
        location: 'Intersection A',
        status: 'Active',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        location: 'Intersection B',
        status: 'Inactive',
        createdAt: new Date(),
        updatedAt: new Date()
      }
    ], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('traffic_signals', null, {});
  }
};
