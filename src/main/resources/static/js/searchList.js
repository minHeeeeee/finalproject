//아무 값이 없는데도 enter키를 누르면 이동하는 것 방지


$(function() {
	$.ajax({
		type: 'post',
		url: '/getSearchList',
		data: {
			'product_name': $('#prd').val()
		},
		success: function(data) {
			console.log(data)
			$.each(data.list, function(index, items) {
				$('<div/>', { class: 'col-12 col-sm-6 col-md-3', style: 'border:none; padding:10px' }).append($('<a/>',{'href':'/detail?seq='+items.product_number}).append($('<img/>', { src: '/storage/' + items.stored_thumbnail, style: 'border:none' })).append($('<div/>', { html: items.product_name + '<br>' + items.product_price.toLocaleString() + '원' }))).appendTo($('#searchListsDiv'));
			});
			$('<p/>', { style: "font-size:18px; text-align:left; font-weight: bold; padding-top:25px; padding-left:25px", html: data.totalB + '&nbsp' + "items" }).appendTo($('#searchResultDiv'));
		},
		error: function(err) {
			console.log(err);
		}
	});
});