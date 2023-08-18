describe('Product Page', () => {
  it('should redirect to product detail page when clicking on 1st product/Scented Blade', () => {
    cy.visit('/');
    cy.get('.products article a').first().click({force: true});
    cy.url().should('include', '/products/');
    cy.get('.product-detail div h1').contains('Scented Blade');
  });
})