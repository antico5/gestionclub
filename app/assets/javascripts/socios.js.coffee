$(document).ready ->
  $('#socio-search-field').on "input", null, null, () ->
    $("#socio-search").submit()
  remotify_will_paginate()
