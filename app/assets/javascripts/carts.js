$(function () {
	$(".addtocart-button").click(function () {
		$.post('/line_items.json', {buycount: $("#buycount").val(), product_id: $("#product_id").val()}, function(result, status) {
			$("#cart_item_count").html(result.count);
			$("#cart").addClass('animated shake');
			alert("已将该商品加入购物车");
		});
		$("#cart").removeClass('animated shake');
		return false;
	});
});
