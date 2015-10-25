$(function () {
	$(".addtocart-button").click(function () {
		$.post('/line_items.json', {
				buycount: $("#buycount").val(),
				product_id: $("#product_id").val()
			},
			function(result, status) {
				//$("#cart_item_count").html(result.count);
				$("#cart").addClass('animated shake');
				$("#cart .point").removeClass('hidden').addClass('show');
				alert("已将该商品加入购物车");
		});
		$("#cart").removeClass('animated shake');
		return false;
	});

	$(".addtocart-button-sm").click(function () {
		$.post('/line_items.json', {
				buycount: 1,
				product_id: $(this).parent(".buy").children("#product_id").val()
			},
			function(result, status) {
				//$("#cart_item_count").html(result.count);
				$("#cart").addClass('animated shake show');
				$("#cart .point").removeClass('hidden').addClass('show');
				alert("已将该商品加入购物车");
		});
		$("#cart").removeClass('animated shake');
		return false;
	});

});
