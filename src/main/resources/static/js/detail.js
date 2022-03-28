$(function() {
	$.ajax({
		url: '/board/getReview',
		data: {
			'product_number': $('#product_number').val()
		},
		type: 'post',
		dataType: 'json',
		success: function(data) {
			console.log(data)
			if (data.length > 0) {
				$('#nothingContent').hide();
				$('#reviewTableDiv').show();
				$.each(data, function(index, item) {
					$('<tr/>').append(
						$('<td/>', { text: item.board_num })
					).append(
						$('<td/>').append($('<a/>', { class:"getReview",'data-board_num':item.board_num,text:item.subject}))
					).append(
						$('<td/>', { text: item.name })
					).append(
						$('<td/>', { text: item.logtime.substring(0, 10) })
					).appendTo($('#reviewTable'));
				})
				
				$('.getReview').on("click",function(e){
					e.preventDefault();
					console.log()
					$('#actionForm').attr("action", "/board/get");
					$('#board_num').val(e.target.getAttribute("data-board_num"))
					$('#actionForm').submit();
				})
			}
		},
		error: function(err) {
			console.log(err)
		}
	})


	$.ajax({
		url: '/getDetail',
		type: 'post',
		data: {
			'product_number': $('#product_number').val()
		},
		dataType: 'json',
		success: function(data) {
			console.log(data);
			$.each(data.imgs, function(index, item) {
				$('<div/>', { class: "col-12 col-sm-6" }).append($('<img/>', { 'src': '/storage/' + item.stored_thumbnail })).appendTo($('#detailImg'));
			});
			$('#productNameDiv').text(data.productDTO.product_name);
			$('<span/>').text(data.productDTO.product_price.toLocaleString() + '원').prependTo($('#orderDiv'));
			$('<pre/>', { text: data.productDTO.product_descrip }).appendTo($('#details'));


			$.each(data.sizes, function(index, item) {
				$('<option/>', { value: item.product_sort_num, 'text': '  ' + item.product_size }).appendTo($('#sizesSelect'))
				$('<th/>', { text: item.product_size }).appendTo($('#product_size'));
				if (item.product_length != 0)
					$('<td/>', { text: item.product_length }).appendTo($('#product_length'))
				if (item.product_shoulder != 0)
					$('<td/>', { text: item.product_shoulder }).appendTo($('#product_shoulder'))
				if (item.product_chest != 0)
					$('<td/>', { text: item.product_chest }).appendTo($('#product_chest'))
				if (item.product_sleeve != 0)
					$('<td/>', { text: item.product_sleeve }).appendTo($('#product_sleeve'))
				if (item.product_waist_width != 0)
					$('<td/>', { text: item.product_waist_width }).appendTo($('#product_waist_width'))
				if (item.product_thigh_width != 0)
					$('<td/>', { text: item.product_thigh_width }).appendTo($('#product_thigh_width'))
				if (item.product_ankle_circumference != 0)
					$('<td/>', { text: item.product_ankle_circumference }).appendTo($('#product_ankle_circumference'))
				if (item.product_front_rise != 0)
					$('<td/>', { text: item.product_front_rise }).appendTo($('#product_front_rise'))
				if (item.product_cap_length != 0)
					$('<td/>', { text: item.product_cap_length }).appendTo($('#product_cap_length'))
				if (item.product_cap_circumference != 0)
					$('<td/>', { text: item.product_cap_circumference }).appendTo($('#product_cap_circumference'))
				if (item.product_detail != null)
					$('<td/>', { text: item.product_detail, 'colspan': 'auto' }).appendTo($('#product_detail'))

			});
			$.each($('table tr'), function(index, item) {
				if (item.childElementCount == 1 || item.childElementCount == 0) {
					item.style.display = 'none';
				}
				if (item.childElementCount == 1) {
					if (item.getAttribute('id') == 'product_detail')
						item.style.display = 'block';
				}

			})
			$('#addCart').click(function() {
				if ($('#sizesSelect').val() == '') {
					Swal.fire({
						icon: 'warning',
						title: '사이즈를 선택해 주세요',
					})
				} else {
					$.ajax({
						url: '/addCart',
						type: 'post',
						data: {
							'product_sort_number': $('#sizesSelect').val()
						},
						success: function() {
							Swal.fire({
								icon: 'success',
								title: '상품을 담았습니다',
								closeOnClickOutside: true
							})
						},
						error: function(err) {
							Swal.fire({
								icon: 'error',
								title: '로그인후 이용해주세요!',
							})
						},
					})
				}
			});
			$('#quickorder').click(function() {
				if ($('#sizesSelect').val() == '') {
					Swal.fire({
						icon: 'warning',
						title: '사이즈를 선택해 주세요',
					})
				} else {
					location.href = "/quickorder?seq=" + $('#sizesSelect').val()
				}
			});
		},
		error: function(err) {
			console.log(err);
		}
	});
});
// Select all tabs
$('.nav-tabs a').click(function() {
	$(this).tab('show');
})

$("#moveWriteForm").on("click", function(e) {
	e.preventDefault();
	$('#actionForm').attr("action", "/board/writeForm");
	$('#actionForm').submit();
});
$("#moveListForm").on("click", function(e) {
	$('#actionForm').submit();
});

