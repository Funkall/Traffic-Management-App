'use strict';

/** @type {import('sequelize-cli').Migration} */

 module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('traffic_plans', [
      {
        name: 'Plan A',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'Plan B',
        createdAt: new Date(),
        updatedAt: new Date()
      }
    ], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('traffic_plans', null, {});
  }
};
