  window.addEventListener('load',function(){
    const priceForm = document.getElementById("item-price")
    
    priceForm.addEventListener('input',function(){
      console.log("OK")
        let taxForm =document.getElementById("add-tax-price");
        let profitForm =document.getElementById("profit");

        
        // 2 Get price
        let price= Number(priceForm.value);


        // 3 Caluculate tax and profit
        const tax = price * 0.1;
        const profit = price - tax;

        // 4 Display tax and profit
          taxForm .innerHTML = tax;
          profitForm.innerHTML = profit;
    })
 });


