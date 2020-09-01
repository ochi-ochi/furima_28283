  window.addEventListener('load',function(){
    const priceForm = document.getElementById("item-price")
   
    priceForm.addEventListener('input',function(){
        let taxForm =document.getElementById("add-tax-price");
        let profitForm =document.getElementById("profit");

        
        // 2 Get price
        let price= Number(priceForm.value);

        // 3 Caluculate tax and profit
        const tax = price * 0.1;
        const jtax = Math.floor(tax)
        const profit = price - jtax;
        
        // 4 Display tax and profit
          taxForm .innerHTML = jtax;
          profitForm.innerHTML = profit;
    })
 });


