$(function () {
	$(".addtocart-button").click(function () {
		$product = $(this).parent(".buy").children("#product_id") ||
				   $(this).parent().parent(".buy").children("#product_id");
		$.post('/line_items.json', {
				buycount: ($("#buycount").val() || 1),
				product_id: $product.val()
			},
			function(result, status) {
				$("#cart_item_count").html(result.count);
				$("#cart").addClass('animated shake');
				alert("已将该商品加入购物车");
		});
		$("#cart").removeClass('animated shake');
		return false;
	});
});
