console.log("動いているか")

function input() {
  const inputs = document.getElementById("item-price");
  const fee_field = document.getElementById('add-tax-price');
  const profit_field = document.getElementById('profit');

  inputs.addEventListener("input", function(){
    let price = inputs.value;
    let fee = price / 10;
    let profit = price - fee;
    fee_field.innerHTML = fee;
    profit_field.innerHTML = profit;
  })
};
window.addEventListener("load", input);