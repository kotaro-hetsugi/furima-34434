const pay = () => {
  Payjp.setPublicKey("pk_test_b1982be0dc806e7fad9b2bfd"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy_buyer[number]"),
      cvc: formData.get("buy_buyer[cvc]"),
      exp_month: formData.get("buy_buyer[exp_month]"),
      exp_year: `20${formData.get("buy_buyer[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);