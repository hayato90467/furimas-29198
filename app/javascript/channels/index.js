// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
  
window.addEventListener('load', function(){
  let list = document.getElementById("price")

  list.addEventListener('input', function(){
    let taxprice = document.getElementById("add-tax-price")
    let profit = document.getElementById("profit")

    // caluculate
    let list = document.getElementById("price").value
    let tax = Math.floor(list * 0.1)
    let profits = Math.floor(list * 0.9)


    // fill in 2 answers
    document.getElementById("add-tax-price").textContent = tax
    document.getElementById("profit").textContent = profits

  })
})