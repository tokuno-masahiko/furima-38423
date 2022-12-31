window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = inputValue * 0.1;
  const profit = document.getElementById("profit")
  profit.innerHTML = inputValue - (inputValue * 0.1) ;
  
  })
})




// window.addEventListener('load', () => {
//   console.log("OK");
// });