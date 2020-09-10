console.log("動いているか")

// 0:windowがloadされた時にイベント発火するようにする
function input() {
  // document.getElementById("item-price").innerHTML = "input";
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
  // price = document.getElementById("item-price").value;
    


// 1:入力欄のid情報を取得する 


// 2:入力欄に値が入力された時のイベントを設置する
// input.addEventListener("keyup", function(){
//   console.log("input")
//   price = document.getElementById("item-price").value;
//     add_tax_price = price * 0.1
//     profit = price * 0.9
// })

