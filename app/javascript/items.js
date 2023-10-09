document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  // 販売価格が変更されたときに計算を行う
  priceInput.addEventListener('input', function() {
    const price = parseInt(priceInput.value, 10);
    if (!isNaN(price)) {
      const tax = Math.floor(price * 0.1);
      const profitValue = price - tax;
      addTaxPrice.textContent = tax;
      profit.textContent = profitValue;
    } else {
      addTaxPrice.textContent = '0';
      profit.textContent = '0';
    }
  });
});
