$(function () {
	$("#parent_catalog").change(function () {
		$.get('/catalogs/'+ $(this).val() + '/subcatalogs.json', function(result) {
			//$(this).empty().appand
			alert(result);
		});
	});
});
