$("#second_large span").mouseover(function(event) {
	$("#third_large").css("display", "flex");
	$("#third_large").empty();
	if (event.currentTarget.innerText == "MEN") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append($("<li/>").append($("<a/>", { text: "TOP", href: "/list?category=men_t-shirts" })))
					.append($("<li/>").append($("<a/>", { text: "BOTTOM", href: "/list?category=men_pants" })))
					.append($("<li/>").append($("<a/>", { text: "BAG", href: "/list?category=men_bag" })))
					.append($("<li/>").append($("<a/>", { text: "HANDWEAR", href: "/list?category=men_handwear" })))
					.append(
						$("<li/>").append($("<a/>", { text: "ACCESSORIES", href: "/list?category=men_accessories" }))
					)
					.append($("<li/>").append($("<a/>", { text: "SHOES", href: "/list?category=men_shoes" })))
					.append(
						$("<li/>").append($("<a/>", { text: "COLLABORATIONS", href: "/list?category=men_balansa x carrtos" }))
					)
			)
			.appendTo($("#third_large"));
		$("<div/>", { class: 'col-3' })
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage1", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage2", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
	} else if (event.currentTarget.innerText == "WOMEN") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append($("<li/>").append($("<a/>", { text: "TOP", href: "/list?category=women_top" })))
					.append($("<li/>").append($("<a/>", { text: "BOTTOM", href: "/list?category=women_bottom" })))
					.append($("<li/>").append($("<a/>", { text: "BAG", href: "/list?category=women_bag" })))
					.append($("<li/>").append($("<a/>", { text: "HANDWEAR", href: "/list?category=women_handwear" })))
					.append(
						$("<li/>").append($("<a/>", { text: "ACCESSORIES", href: "/list?category=women_accessories" }))
					)
					.append($("<li/>").append($("<a/>", { text: "SHOES", href: "/list?category=women_shoes" })))
			)
			.appendTo($("#third_large"));
		$("<div/>", { class: 'col-3' })
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage3", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage4", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
	} else if (event.currentTarget.innerText == "LIFE STYLE") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append(
						$("<li/>").append($("<a/>", { text: "CRAFT PRACTISE", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "CROWCANYON", href: "/list?category=" }))
					)
					.append($("<li/>").append($("<a/>", { text: "HELINOX", href: "/list?category=" })))
					.append(
						$("<li/>").append($("<a/>", { text: "MAGAZINE B", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "NAG CHAMPA", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append(
							$("<a/>", { text: "NTFU COLLECTABLES", href: "/list?category=" })
						)
					)
					.append(
						$("<li/>").append($("<a/>", { text: "SALT RAIN", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "XENIA TALER", href: "/list?category=" }))
					)
			)
			.appendTo($("#third_large"));

		$("<div/>", { class: 'col-3' })
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage5", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage6", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
	} else if (event.currentTarget.innerText == "SALE") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append(
						$("<li/>").append(
							$("<a/>", { text: "ALL SALE", href: "/list?category=" }).append(
								$("<span/>", {
									text: "UP TO 70%",
									style: "color:red;font-size:12px;margin-left:5px",
								})
							)
						)
					)
					.append($("<li/>").append($("<p/>")))
					.append(
						$("<li/>").append($("<a/>", { text: "BROWNYARD", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "CARHARTT WIP", href: "/list?category=" }))
					)
					.append($("<li/>").append($("<a/>", { text: "DEUS", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "GRAMICCI", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "LMC", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "MISCHIEF", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "OBEY", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "POLAR", href: "/list?category=" })))
					.append(
						$("<li/>").append($("<a/>", { text: "THISISNEVERTHAT", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "UNAFFECTED", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "WHIDTHINGS", href: "/list?category=" }))
					)
			)
			.appendTo($("#third_large"));

		$("<div/>", { class: 'col-3' })
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage7", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage8", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
	} else if (event.currentTarget.innerText == "BRANDS") {
		$("<div/>", { class: 'col-3' })
			.append(
				$("<ul/>")
					.append(
						$("<li/>").append($("<a/>", { text: "ARC'TERYX", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "CARHARTT WIP", href: "/list?category=" }))
					)
					.append($("<li/>").append($("<a/>", { text: "HELINOX", href: "/list?category=" })))
					.append(
						$("<li/>").append($("<a/>", { text: "HOKAONEONE", href: "/list?category=" }))
					)
					.append($("<li/>").append($("<a/>", { text: "MERRELL", href: "/list?category=" })))
					.append($("<li/>").append($("<a/>", { text: "POTTERY", href: "/list?category=" })))
					.append(
						$("<li/>").append($("<a/>", { text: "THISISNEVERTHAT", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append(
							$("<a/>", { text: "THEMUSEUMVISITOR", href: "/list?category=" })
						)
					)
					.append(
						$("<li/>").append($("<a/>", { text: "THEOPEN PRODUCT", href: "/list?category=" }))
					)
					.append(
						$("<li/>").append($("<a/>", { text: "XENIA TALER", href: "/list?category=" }))
					)
					.append($("<li/>").append($("<p/>")))
					.append(
						$("<li/>").append(
							$("<a/>", { text: "VIEW ALL BRANDS", class: "small-font" })
						)
					)
			)
			.appendTo($("#third_large"));

		$("<div/>", { "id": "menuimage9", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage10", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage11", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
	} else if (event.currentTarget.innerText == "POST") {
		$("<div/>", { "id": "menuimage12", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage13", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage14", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
		$("<div/>", { "id": "menuimage15", class: "col-3" })
			.append($("<a/>").append($("<p/>")).append($("<img/>",{style:'margin-left:10px;height:80%'})))
			.appendTo($("#third_large"));
	}

	$("li a").mouseenter(function(event) {
		event.currentTarget.setAttribute(
			"style",
			"color:gray;text-decoration:underline"
		);
	});
	$("li a").mouseleave(function(event) {
		event.currentTarget.setAttribute("style", "color:black");
	});
	$.ajax({
		type: 'post',
		url: '/getNavImg',
		success: function(data) {
			$.each(data,function(index,item){
				if($('#'+item.menu).length!=0){
					$('#'+item.menu+' img').attr('src','/storage/menu/'+item.stored_thumbnail);
				}
			})
		},
		error: function(err) {
			console.log(err)
		}
	})
});

$("nav").mouseleave(function() {
	$("#third_large").attr("style", "display:none");
});
$(function() {
	if (window.innerWidth < 800) {
		$('#second_large').hide();
	} else {
		$('#second_small').hide();
	}
	$("#fourth").hide();
	



});

$(".search").click(function() {
	$("#fourth ").animate({ height: "toggle" }, 300, "linear");
});
$("#searchCloseBtn").click(function() {
	$("#fourth").animate({ height: "toggle" }, 200, "linear");
});


$(window).resize(function() {
	if (window.innerWidth < 810) {
		$('#second_large').hide();
		$('#second_small').show();
		$('#third_large').hide();
		$('#third_small').hide();
	} else {
		$('#second_large').show();
		$('#second_small').hide();
		$('#third_large').hide();
		$('#third_small').hide();
	}
});

$('#menu').hover(function() {
	$('#menu i').toggleClass("fa-bars fa-bars-staggered");
});
$("#menu").click(function() {
	$("#third_small").toggle();
});
$("#account").hover(function() {
	$("#account_drop").css("display", "block");
});
$("#account_drop").mouseleave(function() {
	$("#account_drop").css("display", "none");
});

//카카오로그아웃  
$('.logoutBtn').click(function() {
	kakaoLogout();
	$.ajax({
		type: 'post',
		url: '/logout',

		success: function() {
			Swal.fire({
				icon: 'success',
				title: '로그아웃 되었습니다 안녕(*ˊᵕˋ*)ﾉ',
				closeOnClickOutside: false
			}).then(function() {
				location.href = '/index';
			});


		},

		error: function(err) {
			alert(err);
		}
	});
});

$('input[id="keyword"]').keydown(function(event) {
	if (event.keyCode === 13) {
		if ($('#keyword').val() === '') {
			event.preventDefault();
			Swal.fire({
				icon: 'warning',
				title: '검색어를 입력하세요!',
			});
		}
	};
});

$('.cart').click(function() {
	location.href = '/cart'
})

