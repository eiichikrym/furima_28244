$(function(){
  $(".price-input").on('input', function(){
    const price = $(".price-input").val();
    if( 300 <= price && price <= 9999999 && price != /^[0-9]+$/) {
    const fee = Math.floor(price / 10);
    const profit = (price - fee);
    $("#add-tax-price").text(fee);
    $("#profit").text(profit);
    }else if( price < 300 || 9999999 < price && price != /^[0-9]+$/) {
    $("#add-tax-price").text('価格に誤りがあります');
    $("#profit").text('価格に誤りがあります');
    }else{
    $("#add-tax-price").text('半角数字のみ入力可能');
    $("#profit").text('半角数字のみ入力可能');
    }
  })
});