const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //PAY.JPテスト公開鍵
  const form = document.getElementById("item_purchase");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("item_purchase");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("item_purchase[card_number]"),
      cvc: formData.get("item_purchase[card_cvc]"),
      exp_month: formData.get("item_purchase[card_exp_month]"),
      exp_year: `20${formData.get("item_purchase[card_exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) { 
        const token = response.id;
        const renderDom = document.getElementById("item_purchase");
        const tokenObj = `<input value=${token} name ='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("item_purchase").submit();
    });
  });
};

window.addEventListener("load", pay);