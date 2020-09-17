  //var price = ;        //販売価格 
  //var fee = ;     //販売手数料
  //var profit = ;          //販売利益

  window.addEventListener("load",function(){

    const submit = document.getElementById("item-price");
    console.log(submit)

    submit.addEventListener("input", () => {

      var price = document.getElementById("item-price").value;
      var taxDom = document.getElementById("add-tax-price");
      var profitDom = document.getElementById("profit");

      if( price >= 300 && price <= 9999999) {
        var fee = Math.floor(price / 10);
        var profit = (price - fee);
        taxDom.innerHTML = fee;
        profitDom.innerHTML = profit;
      }else{
        taxDom.innerHTML = "正しい金額を入力してください"
        profitDom.innerHTML = "正しい金額を入力してください"
      }
  });
});
