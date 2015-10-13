$(function () {
	$("#parent_catalog").change(function () {
		$.get('/catalogs/'+ $(this).val() + '/subcatalogs.json', function(result) {
			$catalog = $("#product_catalog_id");
			$catalog.empty();
			for(var i = 0; i<result.length; i++) {
				$catalog.append($('<option value=">' + result[i].id.toString() + '">' + result[i].name.toString() + '</option>'));
			}
		});
	});
});
