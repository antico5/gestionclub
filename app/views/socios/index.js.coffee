$('#socios-table tbody').html('<%= render partial: "socio_rows", locals: {socios: @socios} %>')
$('.pagination').html('<%= will_paginate @socios, :container => false %>')
remotify_will_paginate()
