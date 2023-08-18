describe('Adding to cart from Homepage', () => {
  it('should add item to cart from home page, confirm count ', () => {
    cy.visit('/');
    cy.get('.nav-link').contains(' My Cart (0) ');
    cy.get('.products article').first().find('button.btn').contains('Add').click({force: true});
    cy.get('.nav-link').contains(' My Cart (1) ').click();
    cy.get('.cart-show div table tbody tr td').contains('1');
  });
})