$(function(){
	
	$.ajax({
		type:'post',
		url:'/getCartList',
		success:function(data){
			
			console.log(data)
			var totalValue=0;
			var subTotalValue=0;
			var shippingValue=0;
			if(data.length==0){
				$('#mid').hide()
				$('#side').hide()
				$('#noCart').show()
			}
			$.each(data,function(index,item){
			$('<div/>',{class:'product'}).append(
				$('<div/>',{class:'detail'}).append(
					$('<div/>',{class:'img'}).append($('<img/>',{src:'/storage/'+item.stored_thumbnail}))
				).append(
					$('<div/>',{class:'detailDiv'}).append(
						$('<a/>',{href:"/detail?seq="+item.product_number,text:item.product_name})
					).append(
						$('<span/>').text(item.product_size)
					).append(
						$('<span/>').text(item.product_price.toLocaleString()+'원')
					).append(
						$('<div/>',{class:'number'}).append($('<span/>').text(item.product_count+' 개'))
					)
				)
				
			).append($('<div/>',{class:'remove',value:item.cart_number}).text('remove')).appendTo($('#mid'));
				subTotalValue=subTotalValue+item.product_count*item.product_price
			});//each
			totalValue=subTotalValue+shippingValue;
			$('#totalvalue').text(totalValue.toLocaleString()+'원')
			$('#subtotalvalue').text(subTotalValue.toLocaleString()+'원')
			$('#shippingvalue').text(shippingValue.toLocaleString()+'원')
			$('.remove').click(function(event){
				const swalWithBootstrapButtons = Swal.mixin({
                  customClass: {
                     confirmButton: 'btn btn-success',
                     cancelButton: 'btn btn-danger'
                  },
                  buttonsStyling: false
               });
               swalWithBootstrapButtons.fire({
                  title: '정말로 삭제 하실껀가요?',
                  icon: 'warning',
                  showCancelButton: true,
                  confirmButtonText: '넹!!',
                  cancelButtonText: '아니요!!',
                  reverseButtons: false
               }).then((result) => {
                  if (result.isConfirmed) {
                     $.ajax({
                        type: 'post',
                        url: '/deleteCart',
                        data: {
                           'cart_number': event.target.getAttribute("value")
                        },
                        success: function() {
                       
                           Swal.fire({
                              icon: 'success',
                              title: '항목 1개가 삭제되었습니다.',
                              closeOnClickOutside: false
                           }).then(function() {
                              location.href = '/cart';
                           });

                        },

                        error: function(err) {
                           console.log(err);
                        }
                     });

                  } else if (
                     /* Read more about handling dismissals below */
                     result.dismiss === Swal.DismissReason.cancel
                  ) {
                     
                  }
               });
			})
		},
		error:function(err){
			$('#mid').hide()
				$('#side').hide()
				$('#noCart').show()
		}
	})
});

