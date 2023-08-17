describe('Product Page', () => {
  it('should redirect to product detail page when clicking on 1st product/Scented Blade', () => {
    cy.visit('/');
    cy.get('.products article').first().find('button.btn').click({force: true});
    cy.visit('/products/2');
    cy.get('.product-detail div h1').contains('Scented Blade');
  });
})