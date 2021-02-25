window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;                        // 価格の入力値
    const addTaxDom = document.getElementById("add-tax-price"); // 販売手数料のid取得
    addTaxDom.innerHTML = Math.floor( inputValue * 0.1 );       // 販売手数料の計算とHTML反映
    const profitDom = document.getElementById("profit");        // 販売利益のid取得
    profitDom.innerHTML = inputValue - addTaxDom.innerHTML;     // 販売利益の計算とHTML反映
  })
});