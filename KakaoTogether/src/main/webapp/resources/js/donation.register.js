function changePrice(m){
    let price = $('.wrap_fund > .list_pay > .price').text();
    let sumPrice;
    
    if (m == 1000){
        sumPrice = parseInt(price)+1000;
    }  else if (m == 5000) {
        sumPrice = parseInt(price)+5000;
    }  else if (m == 10000) {
        sumPrice = parseInt(price)+10000;
    } else if (m == 50000) {
        sumPrice = parseInt(price)+50000;
    } else if (m == 0) {
        sumPrice = 0;
    }
    
    $('.wrap_fund > .list_pay > .price').text(sumPrice);
    $('input[name=donation]').val(sumPrice);
}

document.getElementById('regBtn').addEventListener('click', (e) =>{
    alert('소중한 후원 감사합니다!')
});