function calc() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1)); //Math. floor→数値の小数点以下の切り捨て処理を行う
    console.log(addTaxDom);
    const profit = document.getElementById("profit")
    profit.innerHTML =(Math.floor(inputValue - addTaxDom.innerHTML)); //価格-販売手数料で利益を出す
    console.log(profit);
  });
}
window.addEventListener("load",calc)