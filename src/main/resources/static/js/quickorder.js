var total = 0;
$(function() {
	$.ajax({
		type: 'post',
		url: '/getQuickorder',
		data: {
			'product_sort_number': window.location.search.split('=')[1]
		},
		success: function(data) {
			console.log(data)
			total = 0;
			let subtotal = 0;
			let shipping = 0;

			$('<div/>', { class: 'youcartDiv' }).append(
				$('<div/>', { class: 'col-2' }).append($('<img/>', { 'src': '/storage/' + data.stored_thumbnail }))
			).append(
				$('<div/>', { class: 'youcartName col-6' }).append(
					$('<p/>', { style: 'margin: 0px 0px 10px 20px' }).text(data.product_name)
				).append(
					$('<span/>').text(data.product_size)
				)
			).append(
				$('<div/>', { class: 'col-2' }).append($('<input/>', { name: 'number', type: 'number', min: '1', value: '1', style: 'border:none;width:80%;text-align:center;', id: 'countInput' }))
			).append(
				$('<div/>', { class: 'col-2', id: 'amount', 'data-val': data.product_price }).text(data.product_price.toLocaleString() + '원')
			).appendTo($('#quickorderList'))
			subtotal = subtotal + data.product_price;
			$('#subtotal').text(subtotal.toLocaleString() + '원')
			$('#shipping').text(shipping.toLocaleString() + '원')
			total = subtotal + shipping;
			$('#total').text(total.toLocaleString() + '원')
			$('#lastTotal').text((total - $('#mileageInput').val()).toLocaleString() + '원')
			$('input[name=number]').change(function() {
				let subtotal = 0;
				subtotal = subtotal + ($('#countInput').val() * Number($('#amount').attr('data-val')))
				$('#amount').text(($('#countInput').val() * Number($('#amount').attr('data-val'))).toLocaleString() + '원')

				$('#subtotal').text(subtotal.toLocaleString() + '원')
				$('#shipping').text(shipping.toLocaleString() + '원')
				total = subtotal + shipping;
				$('#total').text(total.toLocaleString() + '원')
				$('#lastTotal').text((total - $('#mileageInput').val()).toLocaleString() + '원')
			})

		},
		error: function(err) {

		}
	});
});
$('#mileageInput').change(function() {
	if ($('#mileageInput').val() > Number($('#mileageInput').attr('max'))) {
		Swal.fire({
			icon: 'error',
			title: $('#mileageInput').attr('max') + '이하의 숫자를 입력해주세요.',
		});
		$('#mileageInput').val(2000)
	}
	if ($('#mileageInput').val() < Number($('#mileageInput').attr('min'))) {
		$('#mileageInput').val(0)
		Swal.fire({
			icon: 'error',
			title: $('#mileageInput').attr('min') + '이상의 숫자를 입력해주세요.',
		});
	}
	console.log(total)
	$('#lastTotal').text((total - $('#mileageInput').val()).toLocaleString() + '원')
})