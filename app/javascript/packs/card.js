const pay = () => {
  Payjp.setPublicKey("pk_test_ae136ae5a3360413dafbce59");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    console.log("test")
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("trading_information[number]"),
      cvc: formData.get("trading_information[cvc]"),
      exp_month: formData.get("trading_information[exp_month]"),
      exp_year: `20${formData.get("trading_information[exp_year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      console.log(status)
      console.log(response)
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
      }
    });
  });
};

window.addEventListener("load", pay);