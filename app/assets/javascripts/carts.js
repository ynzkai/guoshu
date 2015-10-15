$(function () {
	$(".addtocart-button").click(function () {
		$.post('/carts/addItem.json', {buycount: $("#buycount").val(), product_id: $("#product_id").val()}, function(result) {
			$("#cart_item_count").html(result.count);
			$("#cart").addClass('animated shake');
		});
		$("#cart").removeClass('animated shake');
		return false;
	});
});
