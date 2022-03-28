var menCategory = ['TOP', 'BOTTOM', 'BAG', 'HEADWEAR', 'ACCESSORIES', 'SHOES', 'COLLABORATIONS'];
var topCategory = ['T-SHIRTS', 'SHIRTS', 'KNITS', 'SWEATS', 'JACKETS']
var bottomCategory = ['PANTS', 'SHORTS']
var collaborationsCategory = ['BALANSA X CARRTOS', 'CARHARTT WIP X A.P.C', 'CARHARTT WIP X CONVERSE', 'CARHARTT WIP X WACKO MARIA', 'GRAMICCI X EASTLOGUE', 'HARDHITTERS X DARKR8M STUDIO', 'LMC X NEW ERA', 'THISISNEVERTHAT X CROCS', 'THISISNEVERTHAT X RAMIDUS', 'THISISNEVERTHAT X HOKAONEONE', 'THISISNEVERTHAT X NEW ERA', 'THISISNEVERTHAT X PKM', 'UNAFFECTED X MIZUNO', 'YESEYESEE X NEW ERA']
var womenCategory = ['TOP', 'BOTTOM', 'BAG', 'HEADWEAR', 'ACCESSORIES', 'SHOES'];
var lifeStyleCategory = ['CROWCANYON', 'HELINOX', 'MAGAZINE B', 'NAG CHAMPA', 'NTFU COLLECTABLES', 'SALTRAIN', 'XENIA TALER']

function listPaging(pg2) {
	location.href = "/list?category=" + window.location.search.split("?category=")[1].replace(/%20/gi, ' ').split("&")[0] + "&pg=" + pg2;
}
$(function() {
	if (window.location.search.split("?category=")[1].replace(/%20/gi, ' ').indexOf('women') !== -1) {
		womenCategory.map(
			(item) => $('#categoryName').append($('<li/>').append($('<a/>', { text: item, id: item.toLowerCase(), href: '/list?category=women_' + item.toLowerCase() })))
		)
		if (window.location.search.split("?category=")[1].replace(/%20/gi, ' ').indexOf('_') !== -1)
			$('#' + window.location.search.split("?category=")[1].replace(/%20/gi, ' ').substring(6).split("&")[0]).addClass('selected')
	} else if (window.location.search.split("?category=")[1].replace(/%20/gi, ' ').indexOf('men') !== -1) {
		menCategory.map(
			(item) => {
				if (item == 'BAG' || item == 'HEADWEAR' || item == 'ACCESSORIES' || item == 'SHOES')
					return $('#categoryName').append($('<li/>').append($('<a/>', { text: item, id: item.toLowerCase(), href: '/list?category=men_' + item.toLowerCase() })))
				else
					return $('#categoryName').append($('<li/>', { text: item, id: item.toLowerCase() }))
			}
		)
		$('#top').append($('<ul/>', { style: 'display:none' }))
		topCategory.map((item) => $('#top ul').append(($('<li/>').append($('<a/>', { text: item, id: item.toLowerCase().replace(/ /gi, '_'), href: '/list?category=men_' + item.toLowerCase() })))))
		$('#bottom').append($('<ul/>', { style: 'display:none' }))
		bottomCategory.map((item) => $('#bottom ul').append(($('<li/>').append($('<a/>', { text: item, id: item.toLowerCase().replace(/ /gi, '_'), href: '/list?category=men_' + item.toLowerCase() })))))
		$('#collaborations').append($('<ul/>', { style: 'display:none' }))
		collaborationsCategory.map((item) => $('#collaborations ul').append(($('<li/>').append($('<a/>', { text: item, id: item.toLowerCase().replace(/ /gi, '_'), href: '/list?category=men_' + item.toLowerCase() })))))
		$('#categoryName li').click(function(event) {
			$('#categoryName li ul').css('display', 'none')
			if (event.target.children !== null)
				if (event.target.children[0].style.display == 'none')
					event.target.children[0].style.display = 'block'
			//else
			//event.target.children[0].style.display='none'
		})
		//console.log(window.location.search.split("?category=")[1].replace(/%20/gi,' ').replace(/ /gi,'_').substring(4))
		if (window.location.search.split("?category=")[1].indexOf('_') !== -1)
			$('#' + window.location.search.split("?category=")[1].replace(/%20/gi, ' ').replace(/ /gi, '_').substring(4).split("&")[0]).addClass('selected')
		//console.log($('#'+window.location.search.split("?category=")[1].replace(/%20/gi,' ').replace(/ /gi,'_').substring(4)))
		if (window.location.search.split("?category=")[1].indexOf('_') !== -1)
			$('.selected').parents('ul')[0].style.display = 'block'
	} else if (window.location.search.split("?category=")[1].replace(/%20/gi, ' ').indexOf('lifeStyle') !== -1) {
		lifeStyleCategory.map(
			(item) => $('#categoryName').append($('<li/>').append($('<a/>', { text: item, id: item.toLowerCase(), href: '/list?category=lifeStyle_' + item.toLowerCase() })))
		)
		if (window.location.search.split("?category=")[1].replace(/%20/gi, ' ').indexOf('_') !== -1)
			$('#' + window.location.search.split("?category=")[1].replace(/%20/gi, ' ').substring(10).split("&")[0]).addClass('selected')
	}
	console.log(window.location.search.split("category=")[1].replace(/%20/gi, ' ').split('&')[0]);
	console.log($('#pgInput').val())
	$.ajax({
		type: 'post',
		url: '/getList',
		data: {
			'pg': $('#pgInput').val(),
			'category': window.location.search.split("category=")[1].replace(/%20/gi, ' ').split('&')[0]
		},
		success: function(data) {
			console.log(data)
			$.each(data.list, function(index, items) {
				$('<div/>', { class: 'col-12 col-md-6 col-lg-3', style: 'border:none;padding:10px' }).append($('<a/>',{'href':'/detail?seq='+items.product_number}).append($('<img/>', { src: '/storage/' + items.stored_thumbnail, style: 'border:none' })).append($('<div/>', { html: items.product_name + '<br>' + items.product_price.toLocaleString() + '원' }))).appendTo($('#productListDiv'));
			});
			$('#pagingDiv').html(data.paging);
		},
		error: function(err) {
			console.log(err);
			alert(err);
		}
	});

});