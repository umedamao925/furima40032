window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => { 
    const inputValue = priceInput.value;  

    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = Math.round(inputValue * 0.1);

    const addProfitDom = document.getElementById('profit');
    addProfitDom.innerHTML = Math.floor(inputValue - Math.round(inputValue * 0.1 ));
  });
});