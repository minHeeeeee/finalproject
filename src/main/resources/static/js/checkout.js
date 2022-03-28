var total = 0;
$(function() {
	$.ajax({
		type: 'post',
		url: '/getCartList',
		success: function(data) {
			console.log(data)

			let subtotal = 0;
			let shipping = 0;
			$.each(data, function(index, item) {
				$('<div/>', { class: 'youcartDiv' }).append(
					$('<div/>', { class: 'col-2' }).append($('<img/>', { 'src': '/storage/' + item.stored_thumbnail }))
				).append(
					$('<div/>', { class: 'youcartName col-6' }).append(
						$('<p/>', { style: 'margin: 0px 0px 10px 20px' }).text(item.product_name)
					).append(
						$('<span/>').text(item.product_size)
					)
				).append(
					$('<div/>', { class: 'col-2' }).append($('<input/>', { name: 'number', type: 'number', min: '1', value: '1', style: 'border:none;width:80%;text-align:center;', id: 'countInput_' + index }))
				).append(
					$('<div/>', { class: 'col-2', id: 'amount_' + index, 'data-val': item.product_price }).text(item.product_price.toLocaleString() + '원')
				).appendTo($('#cartList'))
				subtotal = subtotal + item.product_price;
				$('#subtotal').text(subtotal.toLocaleString() + '원')
				$('#shipping').text(shipping.toLocaleString() + '원')
				total = subtotal + shipping;
				$('#total').text(total.toLocaleString() + '원')
				$('#lastTotal').text((total - $('#mileageInput').val()).toLocaleString() + '원')
				$('#totalPrice').val((total - $('#mileageInput').val()))
			})

			$('input[name=number]').change(function() {
				let subtotal = 0;
				$.each($('input[name=number]'), function(index) {
					subtotal = subtotal + ($('#countInput_' + index).val() * Number($('#amount_' + index).attr('data-val')))
					$('#amount_' + index).text(($('#countInput_' + index).val() * Number($('#amount_' + index).attr('data-val'))).toLocaleString() + '원')
					console.log(subtotal)
				});//each
				$('#subtotal').text(subtotal.toLocaleString() + '원')
				$('#shipping').text(shipping.toLocaleString() + '원')
				total = subtotal + shipping;

				console.log(shipping)
				$('#total').text(total.toLocaleString() + '원')
				$('#lastTotal').text((total - $('#mileageInput').val()).toLocaleString() + '원')
				$('#totalPrice').val((total - $('#mileageInput').val()))
			})

		},
		error: function(err) {

		}
	});
});
$('#mileageInput').change(function() {
	if ($('#mileageInput').val() > Number($('#mileageInput').attr('max'))) {
		$('#mileageInput').val(2000)
		Swal.fire({
			icon: 'error',
			title: $('#mileageInput').attr('max') + '이하의 숫자를 입력해주세요.',
		});
	}
	if ($('#mileageInput').val() < Number($('#mileageInput').attr('min'))) {
		$('#mileageInput').val(0)
		Swal.fire({
			icon: 'error',
			title: $('#mileageInput').attr('min') + '이상의 숫자를 입력해주세요.',
		});
	}
	$('#lastTotal').text((total - $('#mileageInput').val()).toLocaleString() + '원')
	$('#totalPrice').val((total - $('#mileageInput').val()))
})