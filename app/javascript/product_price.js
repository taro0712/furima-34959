window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
const taxInput = document.getElementById("add-tax-price");
const profitInput = document.getElementById("profit");

priceInput.addEventListener("input", () => {
const inputValue = priceInput.value;
const taxValue = Math.floor( inputValue * 0.1 )

taxInput.innerHTML = taxValue
console.log(taxInput);

profitInput.innerHTML = Math.floor(inputValue - taxValue )
console.log(profitInput);

})
});